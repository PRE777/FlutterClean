// Notification 滚动监听
import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      new _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比
  double _prog = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.teal[300], Colors.teal[700]],
          )),
        ),
      ),
      body: Scrollbar(
        // 显式指定模板参数时，NotificationListener 便只会接收该参数类型的通知
        // 改例子只接受 ScrollNotification 的通知，若改为ScrollEndNotification则值接受ScrollEndNotification通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            var pixels = notification.metrics.pixels;
            var maxExtent = notification.metrics.maxScrollExtent;
             
            if (pixels > 0 && pixels <= maxExtent) {
              _prog = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            }
            // 重构
            setState(() {
              _progress = "${(_prog * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return true;
            // true 阻止冒泡，其父级Widget将再也收不到该通知
            // 当返回值为false 时继续向上冒泡通知,父组件也可以收到通知。
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("list View $index"),
                  );
                },
              ),
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
