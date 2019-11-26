import 'package:flutter/material.dart';

class PaddingTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding 填充"),
      ),
      body: Container(
        height: 300,
        width: 300,
        color: Colors.red[400],
        child: new PaddingRoute(),
      ),
    );
  }
}

class PaddingRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // 上下左右各添加20像素
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // textDirection: TextDirection.rtl,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Hello World",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.green,
              ),
            ),
          ),
          Padding(
            // 上下添加10像素留白
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "I am jack",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.green,
              ),
            ),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              "your friend",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
