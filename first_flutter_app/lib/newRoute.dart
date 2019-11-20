import 'package:flutter/material.dart'; //导入Material UI组件库

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
        // title: Text(widget.title),
      ),
      body: Center(
        // Text("This is new route")
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "This is new route",
              textScaleFactor: 2.0,
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: "Courier",
              ),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Home: ",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                  )),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
