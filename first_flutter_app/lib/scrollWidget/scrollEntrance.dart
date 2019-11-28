import 'package:flutter/material.dart';

class ScrollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("可滚动组件"),
        ),
        body: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red[200],
                padding: EdgeInsets.all(10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("singleScroll"),
                      textColor: Colors.white70,
                      color: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "singleChildScrollView");
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
