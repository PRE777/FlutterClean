// 文件操作
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';


class FileOperationRoute extends StatefulWidget {
  FileOperationRoute({Key key}) : super(key: key);
  @override
  _FileOperationRoute createState() => new _FileOperationRoute();
}

class _FileOperationRoute extends State<FileOperationRoute> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // 读取文件中数据
    _readCounter().then((int value){
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "实现在应用退出重启后可以恢复点击次数(将数值保存的文件中)",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              ),
              Text("点击了$_counter 次", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        // child: Text("点击了$_counter 次", style: TextStyle(fontSize: 18)),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: new Icon(Icons.add),
      ),
    );
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    final path = await _getLocalFile();
    await path.writeAsString("$_counter");
  }

  // 获取应用目录
  Future<File> _getLocalFile() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return new File("$appDocPath/counter.txt");
  }

  // 读取
  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileOperationRoute {
      return 0;
    }
  }
}
