// flutter 插件开发
// 获取电池电量
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatterylevelTestRoute extends StatefulWidget {
  @override
  _BatterylevelTestRouteState createState() =>
      new _BatterylevelTestRouteState();
}

class _BatterylevelTestRouteState extends State<BatterylevelTestRoute> {
  MethodChannel platform;
  String _batteryLevel = 'Unknown battery level.';
  @override
  void initState() {
    platform = const MethodChannel("samples.flutter.io/battery");
    // platform.setMethodCallHandler(handler)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("获取电池电量"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("获取电池电量"),
              onPressed: () {
                _getBatteryLevel();
              },
            ),
            Text("$_batteryLevel"),
          ],
        ),
      ),
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel = "unkown battery level";
    try {
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = 'Battery level at $result % .';
    } catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
