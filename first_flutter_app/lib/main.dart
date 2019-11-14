import 'package:flutter/material.dart'; //导入Material UI组件库

import 'routerTest.dart';

void main() => runApp(MyApp()); // 应用入口

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Flutter Demo', //应用名称
      theme: ThemeData(
        // 这是应用程序的主题
        primarySwatch: Colors.green,
      ),
  
      //应用首页路由
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // 注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
        "routerTest_page": (context) => RouterTestRoute(),
        "tipRoute_page": (context) =>
            TipRoute(text: ModalRoute.of(context).settings.arguments),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
      },
    );
    return materialApp;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// _MyHomePageState类是继承MyHomePage类对应的State(状态)类
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text(
                "open new route",
              ),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, "new_page");
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return NewRoute();
                //   },
                // ));
              },
            ),
            FlatButton(
              child: Text("RouterTestRoute"),
              textColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, "routerTest_page");
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return RouterTestRoute();
                // }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
        // title: Text(widget.title),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}
