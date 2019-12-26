import 'dart:math';

import 'package:flutter/material.dart';

class CustomDemoRoute extends StatefulWidget {
  @override
  _CustomDemoRouteState createState() => new _CustomDemoRouteState();
}

class _CustomDemoRouteState extends State<CustomDemoRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    bool isForward = true; //
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义控件练习"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget child) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: <Widget>[
                      CustomPaint(
                        size: Size(200, 200),
                        painter: _CustomPaintTest(
                          value: CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.decelerate,
                          ).value,
                        ),
                      ),
                      CustomPaint(
                        size: Size(300, 400),
                        painter: CustomPathPaint(
                          value: CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.decelerate,
                          ).value,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//
class _CustomPaintTest extends CustomPainter {
  _CustomPaintTest({
    this.value,
    this.stops,
  });
  final double value;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    Offset _centerPoint = Offset(size.width / 2, size.height / 2);
    Offset _offSet = Offset(0, 0);
    Rect _rect = _offSet & size;
    double _radius = size.width / 2.0;
    double _value = (value ?? 0.0);
    _value = _value.clamp(.0, 1.0) * pi * 2;
    double _start = .0;
    List<Color> _colors = [
      Colors.tealAccent[400],
      Colors.limeAccent[400],
      Colors.red
    ];
    // 画背景
    var paint = Paint()
      ..color = const Color(0xFFEEEEEE)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    canvas.drawCircle(_centerPoint, _radius, paint);

    // 再画前景，应用渐变色
    if (_value > 0) {
      paint.shader = SweepGradient(
        colors: _colors,
        startAngle: _start,
        endAngle: _value,
        stops: stops,
      ).createShader(_rect);
      canvas.drawArc(_rect, _start, _value, true, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// 根据路径画图
class CustomPathPaint extends CustomPainter {
  CustomPathPaint({
    this.value,
  });

  final double value;
  @override
  void paint(Canvas canvas, Size size) {
    // 画背景
    var paint = Paint()
      ..color = Color(0xFFEEEEEE)
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, paint);

    // 画前景1
    Path path = new Path()..moveTo(100.0, 100.0);
    double x = 100.0 * value.clamp(0.0, 1.0) + 100;
    double y = 100.0 * value.clamp(0.0, 1.0) + 100;
    path.lineTo(x, y);

    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    paint.isAntiAlias = true;
    canvas.drawPath(path, paint);

    // 贝塞尔曲线 画圆
    Path path1 = new Path();
    Rect rect = Rect.fromCircle(center: Offset(200.0, 200.0), radius: 60.0);
    path1.arcTo(rect, 0.0, 2 * pi * value, false);
    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    paint.isAntiAlias = true;
    canvas.drawPath(path1, paint);

    // 贝塞尔曲线画❤
    var width = 200;
    var height = 300;
    Path path2 = new Path();
    path2.moveTo(width / 2, height / 4);
    path2.cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12);
    canvas.drawPath(path2, paint);

    path2.moveTo(width / 2, height / 4);
    path2.cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5,
        width / 2, (height * 7) / 12);
    canvas.drawPath(path2, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
