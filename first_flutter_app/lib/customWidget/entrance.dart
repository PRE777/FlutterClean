import 'package:flutter/material.dart';

class CustomWidgetEntranceRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义组件"),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("自定义渐变按钮"),
                    onPressed: () {
                      Navigator.pushNamed(context, "gradientButton");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(""),
                    onPressed: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(""),
                    onPressed: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(""),
                    onPressed: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(""),
                    onPressed: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(""),
                    onPressed: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(""),
                    onPressed: () {
                      Navigator.pushNamed(context, "");
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
