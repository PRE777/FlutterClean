import 'package:flutter/material.dart';

class AnimatedSwitcherRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("切换动画组件（Switcher）"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green[300],
              child: AnimatedSwictherCounterRoute(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red[300],
              child: AnimatedSwictherCounterRoute1(),
            ),
          )
        ],
      ),
    );
  }
}

// 旧数字执行缩小动画隐藏，新数字执行放大动画显示
class AnimatedSwictherCounterRoute extends StatefulWidget {
  const AnimatedSwictherCounterRoute({Key key}) : super(key: key);
  @override
  _AnimatedSwictherCounterRouteState createState() =>
      new _AnimatedSwictherCounterRouteState();
}

class _AnimatedSwictherCounterRouteState
    extends State<AnimatedSwictherCounterRoute> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("旧数字执行缩小动画隐藏，新数字执行放大动画显示"),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return new ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Text(
              "$_count",
              style: Theme.of(context).textTheme.display2,
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(_count),
            ),
          ),
          RaisedButton(
            child: Text("+1"),
            onPressed: () {
              setState(() {
                _count++;
              });
            },
          )
        ],
      ),
    );
  }
}

// 旧数字执行缩小动画隐藏，新数字执行放大动画显示
class AnimatedSwictherCounterRoute1 extends StatefulWidget {
  const AnimatedSwictherCounterRoute1({Key key}) : super(key: key);
  @override
  _AnimatedSwictherCounterRouteState1 createState() =>
      new _AnimatedSwictherCounterRouteState1();
}

class _AnimatedSwictherCounterRouteState1
    extends State<AnimatedSwictherCounterRoute1> {
  int _count = 0;
  int _count1 = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("旧页面屏幕中向左侧平移退出，新页面重屏幕右侧平移进入"),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
              return MySlideTransition(
                child: child,
                position: tween.animate(animation),
              );
            },
            child: Text(
              "$_count",
              style: Theme.of(context).textTheme.display2,
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(_count),
            ),
          ),
          RaisedButton(
            child: Text("+1"),
            onPressed: () {
              setState(() {
                _count++;
              });
            },
          ),
          Text("封装"),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransitionX(
                child: child,
                direction: AxisDirection.up,
                position: animation,
              );
            },
            child: Text(
              "$_count1",
              style: Theme.of(context).textTheme.display2,
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(_count1),
            ),
          ),
          RaisedButton(
            child: Text("+1"),
            onPressed: () {
              setState(() {
                _count1++;
              });
            },
          ),
        ],
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  const MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;
  final bool transformHitTests;
  final Widget child;
  final AxisDirection direction;
  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      Offset(-offset.dx, offset.dy);
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
