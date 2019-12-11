import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new GestureDetectorTestRoute(),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.yellow[300],
                  alignment: Alignment.center,
                  height: 100,
                  child: _Drag(),
                ),
                _ScaleTestRoute(),
                GestureRecognizerTestRoute()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// GestureDetector
class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 80.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText("单击"),
        onDoubleTap: () => updateText("双击"),
        onLongPress: () => updateText("长按"),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}

// 滚动、拖拽
class _Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<_Drag> {
  double _top = 0.0; // 距顶部偏移量
  double _left = 0.0; // 距左边偏移量
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            // 手指按下触发
            onPanDown: (DragDownDetails e) {
              // 打印手指按下的位置
              print("用户手指按下位置：${e.localPosition}");
            },
            // 手指滑动时触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              // 手指移动时 更新ui
              setState(() {
                print(e.delta.dx);
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            // 滑动结束时
            onPanEnd: (DragEndDetails e) {
              print(e.velocity);
            },
          ),
        ),
      ],
    );
  }
}

// 缩放效果
class _ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 200; // 通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset(
          "./images/gril.png",
          width: _width,
        ),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.5到5倍之间
            print(details.scale.clamp(0.5, 5.0));
            _width = 200 * details.scale.clamp(0.5, 5.0);
          });
        },
      ),
    );
  }
}

//  GestureRecognizer
class GestureRecognizerTestRoute extends StatefulWidget {
  @override
  _GestureRecognizerTestRouteState createState() =>
      _GestureRecognizerTestRouteState();
}

class _GestureRecognizerTestRouteState
    extends State<GestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关
  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(children: [
          TextSpan(text: "Hello world，", style: TextStyle()),
          TextSpan(
              text: "点我，点我，",
              style: TextStyle(
                fontSize: 20,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }),
          TextSpan(text: "让你点你就点啊，是不是傻"),
        ]),
      ),
    );
  }
}
