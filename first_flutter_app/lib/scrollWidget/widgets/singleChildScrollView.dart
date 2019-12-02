import 'package:flutter/material.dart';

// 通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，
// 这是因为SingleChildScrollView不支持基于Sliver的延迟实例化模型，
// 所以如果预计视口可能包含超出屏幕尺寸太多的内容时，
// 那么使用SingleChildScrollView将会非常昂贵（性能差）
class SingleChildScrollTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          reverse: false,
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: str
                  .split("")
                  .map((e) => Text(
                        e,
                        textScaleFactor: 3.0,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
