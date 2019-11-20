import 'package:flutter/material.dart'; //导入Material UI组件库

class MyStateTestPage extends StatefulWidget {
  MyStateTestPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyTestStatePage createState() {
    return MyTestStatePage();
  }

  // @override
  // _MyHomePageState createState() => _MyHomePageState();
}

class MyTestStatePage extends State<MyStateTestPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            child: Text("显示SnackBar"),
            onPressed: () {
              // 通过context来获取State对象（两种方法）
              // ScaffoldState _state = context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
              ScaffoldState _state = Scaffold.of(context);
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar"),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
