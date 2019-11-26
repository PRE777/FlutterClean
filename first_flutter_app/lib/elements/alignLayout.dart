import 'package:flutter/material.dart';

class AlignLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对齐与相对定位（Align）"),
      ),
      body: Center(
        child: new AlignLayoutRoute(),
      ),
    );
  }
}
// 在此建议读者在需要制定一些精确的偏移时应优先使用FractionalOffset，
// 因为它的坐标原点和布局系统相同，能更容易算出实际偏移
class AlignLayoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 显示确定了父组件的大小
        Container(
          color: Colors.blue[50],
          height: 120,
          width: 120,
          child: Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        // 根据子组件来定义父组件大小 heightFactor * size
        // (Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2) 子元素偏移量
        Container(
          color: Colors.green[50],
          child: Align(
            alignment: Alignment.topRight,
            heightFactor: 2,
            widthFactor: 2,
            child: FlutterLogo(
              size: 60.0,
            ),
          ),
        ),
        // Factor 为null，则子组件的宽或高将会占用尽可能多的空间
        Container(
          color: Colors.purple[50],
          child: Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60.0,
            ),
          ),
        ),
        // 实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
        Container(
          color: Colors.red[50],
      
          child: Align(
            heightFactor: 2,
            widthFactor: 2,
            alignment: FractionalOffset(0.2, 0.6),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        )
      ],
    );
  }
}
