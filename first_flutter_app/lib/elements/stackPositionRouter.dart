import 'package:flutter/material.dart';

class StackPositionTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局 Stack、Positioned"),
      ),
      body: Center(
        child: new StackPositionedRoute(),
      ),
    );
  }
}

class StackPositionedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ConstrainedBox尺寸限制类容器
    // 通过ConstrainedBox来确保Stack占满屏幕
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        fit: StackFit.expand, // 用于未定位组件，如何去适应Stack大小
        //  默认loose 使用组件本身大小
        //  expand 延伸到stack大小
        //  "你猜我是谁" 被 Container组件给遮住了
        children: <Widget>[
          Positioned(
            right: 30.0,
            top: 200.0,
            child: Text("你猜我是谁"),
          ),
          Container(
            color: Color.fromARGB(130, 255, 0, 0),
            child: Text(
              "Hello world",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          Positioned(
            left: 30.0,
            child: Text("I am Jack!"),
          ),
          Positioned(
            top: 30.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
