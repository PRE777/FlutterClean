import 'package:flutter/material.dart'; //导入Material UI组件库

void main() => runApp(MyApp()); // 应用入口

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        "tipRoute_page": (context) => TipRoute(),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
      },
    );
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

// test Router pages
class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Router Test Route"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              // var result = await Navigator.of(context).pushNamed("tipRoute_page", arguments:"我是传过来的参数");
              var result = await Navigator.pushNamed(context,"tipRoute_page", arguments:"我是传过来的参数");

              // var result = await Navigator.push(context,
              //     MaterialPageRoute(builder: (context) {
              //   return TipRoute(
              //     text: "我是传过来的参数",
              //   );
              // }));

              print("路由返回值：$result");
            },
            child: Text("打开提示页"),
          ),
        ));
  }
}

class TipRoute extends StatelessWidget {
  // TipRoute({Key key, @required this.text // 接收一个text参数
  //     })
  //     : super(key: key);
  // final String text;
  @override
  Widget build(BuildContext context) {
    // 获取出过来的参数
    var text=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("TipRoute"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "我是返回值");
                },
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
