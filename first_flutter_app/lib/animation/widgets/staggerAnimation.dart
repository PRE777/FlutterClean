// 开始时高度从0增长到300像素，同时颜色由绿色渐变为红色；这个过程占据整个动画时间的60%。
// 高度增长到300后，开始沿X轴向右平移100像素；这个过程占用整个动画时间的40%。

import 'package:flutter/material.dart';

class StaggerAnimationRoute extends StatefulWidget {
  @override
  _StaggerAnimationRouteState createState() => _StaggerAnimationRouteState();
}

class _StaggerAnimationRouteState extends State<StaggerAnimationRoute>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      // debugger();
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stagger 交错动画"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque, // 穿透
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(color: Colors.black.withOpacity(0.5))),
            child: StaggerAnimation(
              controller: _controller,
            ),
          ),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    // 高度动画
    height = Tween<double>(begin: .0, end: 300.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0, 0.6, //间隔，前60%的动画时间
        curve: Curves.ease,
      ),
    ));
    color = ColorTween(
      begin: Colors.orange,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.6, curve: Curves.ease),
    ));
    padding = Tween(
      begin: EdgeInsets.only(left: 0.0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.6, 1, curve: Curves.ease),
    ));
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<Color> color;
  Animation<EdgeInsets> padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return new Container(
          alignment: Alignment.bottomCenter,
          padding: padding.value,
          child: Container(
            color: color.value,
            width: 50.0,
            height: height.value,
          ),
        );
      },
    );
  }
}

