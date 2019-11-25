//  线性布局（row colum）
import 'package:flutter/material.dart';

class LinearLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局（Row、Colum）"),
      ),
      body: Center(
        child: new ColumLayout(),
      ),
    );
  }
}

class ColumLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hello world "),
            Text("I am Tom!"),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center, // 此时该属性没意义
          children: <Widget>[
            Text("hello world "),
            Text("I am Tom!"),
          ],
        ),
        Row(
          textDirection: TextDirection.rtl, // 水平方向布局顺序，默认ltr,从左到右
          children: <Widget>[
            Text("hello world",
                style: TextStyle(color: Colors.red, fontSize: 18)),
            Text(" I am Tom "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("hello world",
                style: TextStyle(color: Colors.blue, fontSize: 18)),
            Text(" I am Tom "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text("hello world",
                style: TextStyle(color: Colors.purple, fontSize: 18)),
            Text(" I am Tom "),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.up, // 垂直方向排列顺序，默认down即从上到下
          children: <Widget>[
            Text("hi"),
            Text(" world "),
          ],
        ),
      ],
    );
  }
}

class SpecialLinearLayoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("特殊线性布局"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max, // 默认 max，尽可能占用主轴宽度，外层Colum高度为整个屏幕
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  children: <Widget>[Text("hello world"), Text("I am jack")],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("hello world 1111"),
                      Text("I am jack "),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _SpecialLinearLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
