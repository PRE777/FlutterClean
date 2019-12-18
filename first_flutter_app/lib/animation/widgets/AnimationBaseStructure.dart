import 'package:flutter/material.dart';

class AnimationTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基本动画结构"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: new ScaleAnimationRoute(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              child: new ScaleAnimationRoute1(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
              child: new ScaleAnimationRoute2(),
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
        new AnimationController(duration: Duration(seconds: 2), vsync: this);
    // 使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    // 图片宽高从0 -> 300
    animation = new Tween(begin: 20.0, end: 150.0).animate(animation)
      ..addListener(() {
        setState(() => {print(animation.value)});
      });
    // 开启动画(正向执行动画)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        './images/gril.png',
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState1 createState() => new _ScaleAnimationRouteState1();
}

// AnimatedWidget 分离
// 需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin
class _ScaleAnimationRouteState1 extends State<ScaleAnimationRoute1>
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
        new AnimationController(duration: Duration(seconds: 2), vsync: this);
    // 使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    // 图片宽高从0 -> 300
    animation = new Tween(begin: 50.0, end: 150.0).animate(animation);
    // 开启动画(正向执行动画)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedImage(animation: animation);
  }
}

class ScaleAnimationRoute2 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState2 createState() => new _ScaleAnimationRouteState2();
}

// AnimatedWidget 分离
// 需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin
class _ScaleAnimationRouteState2 extends State<ScaleAnimationRoute2>
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
        new AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    // 图片宽高从0 -> 300
    animation = new Tween(begin: 50.0, end: 150.0).animate(animation);
    // 开启动画(正向执行动画)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
        animation: animation, child: Image.asset('./images/avatar.png'));
  }
}

// AnimatedWidget 分离(但是动画渲染中存在Image)
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset(
        './images/gril.png',
        width: animation.value,
        height: animation.value,
      ),
    );
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
