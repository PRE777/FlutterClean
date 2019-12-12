import 'package:flutter/material.dart';

class NotificationTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通知"),
      ),
      body: Center(
        child: NotificationRoute(),
      ),
    );
  }
}

// 自定义通知
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() => _NotificationRouteState();
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";
  String _newMsg = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // 阻止冒泡通知
        NotificationListener<MyNotification>(
          onNotification: (MyNotification notification) {
            setState(() {
              _msg += notification.msg + " ABC ";
            });
            return true; // 阻止冒泡
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      child: Text("发送通知(阻止冒泡)"),
                      onPressed: () {
                        MyNotification("Hi").dispatch(context);
                      },
                    );
                  },
                ),
                Text(_msg),
              ],
            ),
          ),
        ),

        // 未阻止冒泡通知
        NotificationListener<MyNotification>(
          onNotification: (MyNotification notification) {
           print("不阻止冒泡,${notification.msg}");
            return true; 
          },
          child: NotificationListener<MyNotification>(
            onNotification: (notification) {
              setState(() {
                _newMsg += notification.msg + " ABC ";
              });
              return false; // 不阻止冒泡,则父组件也可以接受到通知
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      return RaisedButton(
                        child: Text("发送通知(不阻止冒泡)"),
                        onPressed: () {
                          MyNotification("OY").dispatch(context);
                        },
                      );
                    },
                  ),
                  Text(_newMsg),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
