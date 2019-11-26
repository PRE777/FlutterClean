// 超出屏幕显示范围会自动折行的布局称为流式布局
import 'package:flutter/material.dart';

class WrapFlowLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局wrap、flow"),
      ),
      body: Center(
        child: new WrapRoute(),
      ),
    );
  }
}

class WrapRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10.0, // 主轴方向widget的间距
      runSpacing: 5.0, // 纵轴方向widget的间距
      alignment: WrapAlignment.center, // 主轴方向对齐方式
      runAlignment: WrapAlignment.center, // 纵轴方向对齐方式
      textDirection: TextDirection.ltr,// 水平方向从左到右
      verticalDirection: VerticalDirection.up,// 垂直方向从下到上
      children: <Widget>[
        new Chip(
          avatar: new CircleAvatar(
            backgroundColor: Colors.red,
            child: Text("A"),
          ),
          label: new Text("Hamilton"),
        ),
        new Chip(
          avatar: new CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("B"),
          ),
          label: new Text("Lafayette"),
        ),
        new Chip(
          avatar: new CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("C"),
          ),
          label: new Text("Mulligan"),
        ),
          new Chip(
          avatar: new CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("D"),
          ),
          label: new Text("Laurens"),
        ),
      ],
    );
  }
}
