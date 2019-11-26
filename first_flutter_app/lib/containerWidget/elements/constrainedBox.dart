import 'package:flutter/material.dart';

class ConstrainedBoxTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("constrainedBox 尺寸限制类容器"),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.blue[100],
        child: new ConstrainedBoxRoute(),
      ),
    );
  }
}

class ConstrainedBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // 用于对子组件添加额外的约束
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 50.0, // 设置最小高度
            minWidth: double.infinity, //
          ),
          child: Container(
            child: redBox,
            height: 5.0,
          ),
        ),
        // 用于给子元素指定固定的宽高
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: SizedBox(
            width: 300,
            height: 100,
            child: greenBox,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 100.0,
              minWidth: 60.0,
            ),
            child: UnconstrainedBox(
              //“去除”父级限制
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 200,
                  minHeight: 30,
                ),
                child: blueBox,
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);
Widget greenBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.green),
);
Widget blueBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.blue),
);
