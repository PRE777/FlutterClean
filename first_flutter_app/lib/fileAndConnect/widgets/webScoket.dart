// 简单的webSocket
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketTestRoute extends StatefulWidget {
  @override
  _WebSocketTestRouteState createState() => new _WebSocketTestRouteState();
}

class _WebSocketTestRouteState extends State<WebSocketTestRoute> {
  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";
  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect("ws://echo.websocket.org");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Send message",
                  hintText: "输入发送信息",
                  icon: Icon(Icons.send),
                ),
              ),
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (BuildContext context,AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  _text = "网络不通……";
                } else if (snapshot.hasData) {
                  _text = "echo:" + snapshot.data;
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(_text),
                );
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("发送消息"),
              onPressed: () {
                _sendMessage();
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("Stream 测试"),
              onPressed: () {
                _streamTest();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }
}

void _streamTest() async {
  StreamController controller = StreamController<String>(sync: false);
  StreamSink sink = controller.sink;
  Stream stream = controller.stream;
  stream.transform(StreamTransformer<String, String>.fromHandlers(
    handleData: (String data, EventSink<String> sink) {
      // 在这里设置transform 是没有用的，不会走这里； 除非在stream.transform返回的stream上加listen监听。
      if (!data.contains("数据2")) {
        sink.add(data);
      }
    },
  ));

  // controller.stream.listen((data) => print("嘿嘿嘿:$data"));
  sink.add("3秒后才设置监听。");
  Timer(Duration(seconds: 3), () {
    StreamSubscription subscription =
        stream.transform(StreamTransformer<String, String>.fromHandlers(
      handleData: (String data, EventSink<String> sink) {
        print("transform");
        if (!data.contains("数据3")) {
          sink.add(data);
        }
      },
    )).listen((event) {
      print("接收到新的消息： " + event);
    }, onError: (err) => print(err));

    sink.add("这是一条新数据");
    Timer(Duration(milliseconds: 100), () {
      sink.add("pause……");
      subscription.pause();
      sink.add("我是一条新的数据pause");
    });
    Timer(Duration(seconds: 5), () {
      subscription.resume();
      sink.add("我是一条新的数据2");
    });
  });
}
