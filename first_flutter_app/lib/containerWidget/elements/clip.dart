import 'package:flutter/material.dart';

// 剪裁是在layout完成后的绘制阶段进行的，所以不会影响组件的大小
class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/gril.png", width: 80, height: 80);
    return Scaffold(
      appBar: AppBar(
        title: Text("Clip 剪切"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: avatar, // 未处理
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ClipOval(
                child: avatar, //剪切为圆形
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: ClipRRect(
                //圆角矩形
                child: avatar,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.5, //宽度设为原来宽度一半，另一半会溢出
                  child: avatar,
                ),
                Text(
                  "Hello World",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 0.5, //宽度设为原来宽度一半，另一半会溢出
                    child: avatar,
                  ),
                ),
                Text(
                  "Hello World",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                  ),
                  child: ClipRect(
                    clipper: MyClipper(),
                    child: avatar,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 自定义裁剪区域
class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10, 10, 60, 60);
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
