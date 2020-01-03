// 分块下载，像是断点续传功能
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

class DownLoadWithChunks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分块下载"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text("发送请求"),
          onPressed: () async {
            var url =
                "http://download.dcloud.net.cn/HBuilder.9.0.2.macosx_64.dmg";
            // url =
            //     "http://10.3.11.44:8080/gridgeneration/data/dataGriddingDistribution?tokens=00100144a0af65-b413-431a-8788-a85f3d5e4b6d";
            var savePath = "/Users/iwhere/Desktop/Diodownload/macosx_64.dmg";
            await downloadWithChunks(url, savePath,
                onReceiveProgress: (received, total) {
              if (total != -1) {
                print("${(received / total * 100).floor()}%");
              }
            });
          },
        ),
      ),
    );
  }
}

Future downloadWithChunks(
  url,
  savePath, {
  ProgressCallback onReceiveProgress,
}) async {
  const firstChunkSize = 102;
  const maxChunk = 3;

  int total = 0;
  var dio = Dio();
  var progress = <int>[];

  createCallback(no) {
    return (int received, _) {
      progress[no] = received;
      if (onReceiveProgress != null && total != 0) {
        // onReceiveProgress(progress.reduce((a, b) => a + b), total);
        onReceiveProgress(progress.reduce((a, b) => a + b), total);
      }
    };
  }

  Future<Response> downloadChunk(url, start, end, no) async {
    progress.add(0); //progress记录每一块已接收数据的长度
    --end;
    return dio.download(
      url,
      savePath + "temp$no", //临时文件按照块的序号命名，方便最后合并
      onReceiveProgress: createCallback(no),
      options: Options(
        headers: {"range": "bytes=$start-$end"}, //指定请求的内容区间
      ),
    );
  }

  Future mergeTempFiles(chunk) async {
    File f = File(savePath + "temp0");
    IOSink ioSink = f.openWrite(mode: FileMode.writeOnlyAppend);
    for (int i = 1; i < chunk; ++i) {
      File _f = File(savePath + "temp$i");
      await ioSink.addStream(_f.openRead());
      await _f.delete(); //删除临时文件
    }
    await ioSink.close();
    await f.rename(savePath); //合并后的文件重命名为真正的名称
  }

  Response response = await downloadChunk(url, 0, firstChunkSize, 0);
  if (response.statusCode == 206) {
    //解析文件总长度，进而算出剩余长度
    total = int.parse(
        response.headers.value(HttpHeaders.contentRangeHeader).split("/").last);
    int reserved = total -
        int.parse(response.headers.value(HttpHeaders.contentLengthHeader));
    //文件的总块数(包括第一块)
    int chunk = (reserved / firstChunkSize).ceil() + 1;
    if (chunk > 1) {
      int chunkSize = firstChunkSize;
      if (chunk > maxChunk + 1) {
        chunk = maxChunk + 1;
        chunkSize = (reserved / maxChunk).ceil();
      }
      var futures = <Future>[];
      for (int i = 0; i < maxChunk; ++i) {
        int start = firstChunkSize + i * chunkSize;
        //分块下载剩余文件
        futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
      }
      //等待所有分块全部下载完成
      await Future.wait(futures);
    }
    await mergeTempFiles(chunk);
  }
}
