// 手势竞争与冲突
import 'package:flutter/material.dart';

class GestureArenaConflictRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势竞争与冲突"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Text("首次移动时的位移在水平和垂直方向上的分量大的一个获胜"),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow[300],
              child: BothDirectionTestRoute(),
            ),
          ),
          Text("手势冲突"),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[400],
              child: GestureConflictTestRoute(),
            ),
          ),
          Text("Listener 解决手势冲突"),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[400],
              child: SolveConflictTestRoute(),
            ),
          )
        ],
      ),
    );
  }
}

// 手势竞争
class BothDirectionTestRoute extends StatefulWidget {
  @override
  _BothDirectionTestRouteState createState() => _BothDirectionTestRouteState();
}

class _BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 0;
  double _left = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("B"),
            ),
            onHorizontalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _left += e.delta.dx;
              });
            },
            onVerticalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _top += e.delta.dy;
              });
            },
          ),
        ),
      ],
    );
  }
}

// 手势冲突
class GestureConflictTestRoute extends StatefulWidget {
  @override
  _GestureConflictTestRouteState createState() =>
      _GestureConflictTestRouteState();
}

class _GestureConflictTestRouteState extends State<GestureConflictTestRoute> {
  double _left = 0;
  var _textStr = "null";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 150,
          top: 50,
          child: Text(
            _textStr,
            style: TextStyle(
              color: Colors.red,
              fontSize: 17,
              backgroundColor: Colors.green,
            ),
          ),
        ),
        Positioned(
          left: _left,
          child: GestureDetector(
            //要拖动和点击的widget
            child: CircleAvatar(
              child: Text("C"),
            ),
            // 横向拖拽
            onHorizontalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _left += e.delta.dx;
              });
            },
            // 拖拽解说
            onHorizontalDragEnd: (DragEndDetails e) {
              setState(() {
                _textStr = "拖拽结束";
              });
              print("拖拽结束");
            },
            // 点击
            onTapDown: (details) {
              setState(() {
                _textStr = "按 下";
              });
              print("按 下");
            },
            //
            onTapUp: (details) {
              setState(() {
                _textStr = "抬 起";
              });
              print("抬 起");
            },
          ),
        ),
      ],
    );
  }
}

class SolveConflictTestRoute extends StatefulWidget {
  @override
  _SolveConflictTestRouteState createState() => _SolveConflictTestRouteState();
}

class _SolveConflictTestRouteState extends State<SolveConflictTestRoute> {
  double _left = 0;
  var _textStr = "null";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 150,
          top: 50,
          child: Text(
            _textStr,
            style: TextStyle(
              color: Colors.red,
              fontSize: 17,
              backgroundColor: Colors.green,
            ),
          ),
        ),
        Positioned(
          left: _left,
          child: Listener(
            onPointerDown: (details) {
              setState(() {
                _textStr = "按下";
              });
              print("按 下");
            },
            onPointerUp: (details) {
              setState(() {
                _textStr = "抬 起";
              });
              print("抬 起");
            },
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("D"),
              ),
              onHorizontalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  _textStr = "拖 拽";
                });
              },
              onHorizontalDragEnd: (DragEndDetails e) {
                setState(() {
                  // _textStr = "拖拽结束";
                });
                print("拖拽结束");
              },
            ),
          ),
        ),
      ],
    );
  }
}
