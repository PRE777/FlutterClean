import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局Row、Colum"),
      ),
      body: Center(
        child: new _FlexLayoutRoute(),
      ),
    );
  }
}

class _FlexLayoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          //Flex的两个子widget按1：2来占据水平空间
          direction: Axis.horizontal, // 弹性布局的方向, horizontal水平 vertical垂直
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                height: 30.0,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
                height: 40.0,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            height: 100.0,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    // height: 30.0,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // height: 30.0,
                    color: Colors.yellow,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
