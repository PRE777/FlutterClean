import 'package:flutter/material.dart';

class FunctionalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能型组件"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.teal[300], Colors.teal[700]],
          )),
        ),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[350],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RaisedButton(
                    child: Text("导航返回拦截"),
                    textColor: Colors.white,
                    color: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "willPopScope");
                    },
                  ),
                  RaisedButton(
                    child: Text("数据共享"),
                    textColor: Colors.white,
                    color: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "shareDataRoute");
                    },
                  ),
                  RaisedButton(
                    child: Text("跨组件状态共享"),
                    textColor: Colors.white,
                    color: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "provider");
                    },
                  ),
                  RaisedButton(
                    child: Text("路由换肤"),
                    textColor: Colors.white,
                    color: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "changeTheme");
                    },
                  ),
                  RaisedButton(
                    child: Text("异步UI更新"),
                    textColor: Colors.white,
                    color: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "asyncUpdateUI");
                    },
                  ),
                  RaisedButton(
                    child: Text(""),
                    textColor: Colors.white,
                    color: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
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
