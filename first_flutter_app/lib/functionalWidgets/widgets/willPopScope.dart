import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航返回拦截"),
      ),
      body: Center(
        child: new WillPopScopeRoute(),
      ),
    );
  }
}

class WillPopScopeRoute extends StatefulWidget {
  @override
  _WillPopScopeRouteState createState() => new _WillPopScopeRouteState();
}

class _WillPopScopeRouteState extends State<WillPopScopeRoute> {
  DateTime _lastPressedAt; // 上次点击的时间
  DateTime _backBtnLastPressedAt; // 自定义返回按钮 点击时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          // 两次点击间隔超过1秒则重新计时
          _lastPressedAt = new DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("1秒内连续按两次导航栏返回键退出"),
            Padding(
              padding: EdgeInsets.only(top:10),
            ),
            Text("1秒内连续按两次自定义返回键退出"),
            RaisedButton(
              child: Text("返 回"),
              textColor: Colors.white,
              color: Colors.blue[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {
                if (_backBtnLastPressedAt == null ||
                    DateTime.now().difference(_backBtnLastPressedAt) >
                        Duration(seconds: 1)) {
                  _backBtnLastPressedAt = DateTime.now();
                } else {
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
