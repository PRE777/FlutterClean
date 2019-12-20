// 动画过渡组件
import 'package:flutter/material.dart';

class AnimatedTransitionRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画过渡组件"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green[300],
              child: AnimationTransitionTest(),
            ),
          ),
          Expanded(
            flex: 3,
            // child: new AnimatedWidgetsTest(),
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              color: Colors.red[300],
              child: new AnimatedWidgetsTest(),
            ),
          )
        ],
      ),
    );
  }
}

class AnimationTransitionTest extends StatefulWidget {
  @override
  _AnimationTransitionTestState createState() =>
      new _AnimationTransitionTestState();
}

class _AnimationTransitionTestState extends State<AnimationTransitionTest> {
  Color _decorationColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(""),
          AnimatedDecoratedBox(
            duration: Duration(
                milliseconds: _decorationColor == Colors.red ? 400 : 2000),
            decoration: BoxDecoration(color: _decorationColor),
            child: Builder(builder: (context) {
              return new FlatButton(
                child: Text(
                  "点我变色",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _decorationColor = _decorationColor == Colors.blue
                        ? Colors.red
                        : Colors.blue;
                  });
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  const AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    Curve curve = Curves.linear, //动画曲线
    @required this.duration, // 正向动画执行时长
    Duration reverseDuration, // 反向动画执行时长
    this.child,
  }) : super(
          key: key,
          duration: duration,
        );

  final Duration duration;
  final Widget child;
  final BoxDecoration decoration;
  @override
  _AnimatedDecoratedBoxState createState() => new _AnimatedDecoratedBoxState();
}

class _AnimatedDecoratedBoxState
    extends ImplicitlyAnimatedWidgetState<AnimatedDecoratedBox> {
  DecorationTween _decorationTween; //定义一个Tween
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decorationTween.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decorationTween = visitor(_decorationTween, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}

class AnimatedWidgetsTest extends StatefulWidget {
  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black, fontSize: 20);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(milliseconds: 2000);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _padding = 20;
              });
            },
            child: AnimatedPadding(
              padding: EdgeInsets.all(_padding),
              duration: Duration(milliseconds: 1000),
              child: Text("AnimatedPadding"),
            ),
          ),
          SizedBox(
            height: 50,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1000),
                  left: _left,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _left = 100;
                      });
                    },
                    child: Text(
                      "AnimatedPositioned",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // curve: Curves.linear,
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey,
            child: AnimatedAlign(
              duration: duration,
              alignment: _align,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _align = Alignment.center;
                  });
                },
                child: Text("AnimatedAlign"),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            height: _height,
            color: _color,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _height = 150;
                  _color = Colors.blue;
                });
              },
              child: Text(
                "AnimatedContainer",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
            child: GestureDetector(
              child: Text("hello world"),
              onTap: () {
                setState(() {
                  _style = TextStyle(
                    color: Colors.blue,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.green,
                    fontSize: 40,
                  );
                });
              },
            ),
            style: _style,
            duration: duration,
          ),
          AnimatedDecoratedBox(
            duration: duration,
            decoration: BoxDecoration(color: _decorationColor),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _decorationColor = Colors.red;
                });
              },
              child: Text(
                "AnimatedDecoratedBox",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ].map((e) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: e,
          );
        }).toList(),
      ),
    );
  }
}
