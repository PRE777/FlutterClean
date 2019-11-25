import 'package:flutter/material.dart';

class ElementTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("部分控件样式入口"),
      ),
      body: Center(
        child: new ElementTextContent(),
      ),
    );
  }
}

class ElementTextContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.red,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text("单选开关和复选框"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, "swicthAndCheckbox");
                    },
                  ),
                  // textFieldForm
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("输入框"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, "textFieldTest");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("表单"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, "textFieldForm");
                    },
                  ),
                   RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("线性布局"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, "linearLayout");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("特殊线性布局"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, "specialLinearLayoutRoute");
                    },
                  ),
                   RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("弹性线性布局"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, "flexLayoutRoute");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
