import 'package:flutter/material.dart';

class ContainerTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Container 容器"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50.0, left: 150.0),
              // constraints: BoxConstraints.tightFor(height: 100,width: 100.0),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                    //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: 0.95),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2, 2),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              transform: Matrix4.rotationZ(0.2),
              alignment: Alignment.center,
              child: Text(
                "5.20",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.orange,
              child: Text("Hello World"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60, bottom: 20),
              child: Container(
                // 容器内填白
                padding: EdgeInsets.all(20),
                color: Colors.orange,
                child: Text("Hello World"),
              ),
            ),
          ],
        ));
  }
}
