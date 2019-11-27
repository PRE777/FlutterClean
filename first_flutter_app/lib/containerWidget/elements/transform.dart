import 'dart:math';

import 'package:flutter/material.dart';

class TransformTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("转换transform"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Transform.rotate(
                  // 旋转90度
                  angle: pi / 2,
                  child: Text(
                    "旋转90度",
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              // 缩放
              padding: EdgeInsets.symmetric(vertical: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Transform.scale(
                  scale: 2.0,
                  child: Text("缩放"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Text("Hello world"),
                    ),
                  ),
                  Text(
                    "你好",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: RotatedBox(
                      quarterTurns: 1,// 旋转90度
                      child: Text("Hello world",style: TextStyle(color: Colors.yellow,fontSize: 18),),
                    ),
                  ),
                  Text(
                    "你好",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
