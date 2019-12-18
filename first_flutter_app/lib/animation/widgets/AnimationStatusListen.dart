import 'package:flutter/material.dart';

// 先放大再缩小再放大……这样的循环动画
// 心跳效果

class AnimationListenTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画状态监听"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green[300],
              child: new ScaleAnimationRoute(),
            ),
          )
        ],
      ),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

// 最原始写法
// 需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    // 使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    // 图片宽高从0 -> 300
    animation = new Tween(begin: 100.0, end: 200.0).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      }else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    // 开启动画(正向执行动画)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
        animation: animation, child: Image.asset('./images/heart.png'));
  }
}

// AnimatedBuilder 抽离动画(动画渲染域Image分离)
class GrowTransition extends StatelessWidget {
  GrowTransition({this.animation, this.child});
  final Animation<double> animation;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (BuildContext ctx, Widget child) {
          return new Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
