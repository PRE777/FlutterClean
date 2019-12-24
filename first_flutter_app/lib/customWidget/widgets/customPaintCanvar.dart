import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintCanvarRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " 自绘组件(CustomPaint与Canvas)",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: CustomPaintRoute(),
    );
  }
}

/**
 * size：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸。
 * 如果有child但是想指定画布为特定大小，可以使用SizeBox包裹CustomPaint实现。
 */
class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: CustomPaint(
                size: Size(300, 300), // 此时无效
                painter: MyPainter(),
                child: RepaintBoundary(
                  child: Text(
                    "sss",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        backgroundColor: Colors.red),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          CustomPaint(
            size: Size(300, 300), //指定画布大小
            painter: MyPainter(), // 定义画布背景，会显示在子节点后面
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;
    //画棋盘背景
    var paint = Paint();
    paint.isAntiAlias = true; //是否抗锯齿
    paint.style = PaintingStyle.fill; //画笔样式：填充
    paint.color = Color(0x77cdb175); //画笔颜色
    canvas.drawRect(Offset.zero & size, paint);

    // 画网格
    paint.style = PaintingStyle.stroke; //线
    paint.color = Colors.black87;
    paint.strokeWidth = 1.0;

    for (var i = 0; i <= 15; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint); // 画线
    }
    for (var i = 0; i <= 15; i++) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint); // 画线
    }
    // 画一个黑子
    paint.style = PaintingStyle.fill;
    paint.color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
    //  画一个白子
    paint.style = PaintingStyle.fill;
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 + eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  @override
  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true(会重绘）
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
