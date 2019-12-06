import 'package:flutter/material.dart';

class AsyncUpdateUITestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异步UI更新"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red[200],
              child: new FutureBuilderTestRoute(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green[200],
              child: new StreamBuilderTestRoute(),
            ),
          )
        ],
      ),
    );
  }
}

// 耗时操作
Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

class FutureBuilderTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: mockNetworkData(),
        initialData: "这是个什么?",
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          //  请求结束
          if (snapShot.connectionState == ConnectionState.done) {
            if (snapShot.hasError) {
              //  请求失败，显示错误信息
              return Text("Error:${snapShot.error}");
            } else {
              //  请求成功，显示成功数据
              return Text("Content:${snapShot.data}");
            }
          } else {
            //   正在请求数据
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

// Stream
Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}

class StreamBuilderTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: counter(),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.hasError) {
            return Text('Error: ${snapShot.error}');
          }
          switch (snapShot.connectionState) {
            case ConnectionState.none:
              return Text('没有Stream');
            case ConnectionState.waiting:
              return Text('等待数据...');
            case ConnectionState.active:
              return Text('active: ${snapShot.data}');
            case ConnectionState.done:
              return Text('Stream已关闭');
          }
          return null;
        },
      ),
    );
  }
}
