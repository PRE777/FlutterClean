import 'package:flutter/material.dart';

class PointerEventTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原始指针事件处理"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.green,
              child: ListenerTestRoute(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              color: Colors.green,
              child: Listener(
                child: Container(
                  constraints: BoxConstraints.tight(Size(300, 150)),
                  child: Center(
                    child: Text("Box A",
                        style: TextStyle(
                            color: Colors.white, backgroundColor: Colors.blue)),
                  ),
                ),
                // behavior: HitTestBehavior.opaque,
                onPointerDown: (PointerDownEvent event) => print("Down A"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.blue)),
                  ),
                  onPointerDown: (event) => print("down0"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                  ),
                  onPointerDown: (event) => print("down1"),
                  behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透",整个区域以及它下面的区域
                )
              ],
            ),
            Listener(
              child: AbsorbPointer(
                child: Listener(
                  child: Container(
                    color: Colors.red,
                    width: 200.0,
                    height: 100.0,
                  ),
                  onPointerDown: (event) => print("in"),
                ),
              ),
              onPointerDown: (event) => print("up"),
            )
          ],
        ),
      ),
    );
  }
}

class ListenerTestRoute extends StatefulWidget {
  @override
  _ListenerTestRouteState createState() => _ListenerTestRouteState();
}

class _ListenerTestRouteState extends State<ListenerTestRoute> {
  //定义一个状态，保存当前指针位置
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300,
        height: 150,
        child: Text(
          _event?.position?.toString() ?? "Box B",
          style: TextStyle(color: Colors.white),
        ),
      ),
      // behavior: HitTestBehavior.deferToChild,
      onPointerDown: (PointerDownEvent event) => setState(() {
        _event = event;
      }),
      onPointerMove: (PointerMoveEvent event) => setState(() {
        _event = event;
      }),
      onPointerUp: (PointerUpEvent event) => setState(() {
        _event = event;
      }),
    );
  }
}
