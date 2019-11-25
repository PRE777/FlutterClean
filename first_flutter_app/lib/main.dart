import 'package:flutter/material.dart'; //导入Material UI组件库
// import 'package:english_words/english_words.dart';

import 'routerTest.dart';
import 'newRoute.dart';
import 'english_word_test.dart';
import 'show_snackBar.dart';
import 'activeMangerByParent.dart';
import 'customButton.dart';
import 'imageTest.dart';
import 'elementTest.dart';
import 'elements/switchAndCheckbox.dart';
import 'elements/textFieldTest.dart';
import 'elements/textFieldForm.dart';
import 'elements/linearLayout.dart';
import 'elements/flexLayoutRoute.dart';
void main() => runApp(MyApp()); // 应用入口

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Flutter Demo', //应用名称
      theme: ThemeData(
        // 这是应用程序的主题
        brightness: Brightness.light,
        // primaryColor: Colors.black,// 主题颜色primaryColor 优先级高于主题样本primarySwatch
        primarySwatch: Colors.teal,
        // hintColor: Colors.red,
    
        // hintColor: Colors.blue,
      ),

      //应用首页路由
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // 注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
        "routerTest_page": (context) => RouterTestRoute(),
        "show_snackBar": (context) => MyStateTestPage(),
        "activeMangerByParent": (context) => ParentMangerTest(),
        "customButton": (context) => CustomButton(),
        "imageTest": (context) => ImageTestDart(),
        "elementTest": (context) => ElementTest(),
        "swicthAndCheckbox": (context) => SwicthAndCheckbox(),
        "textFieldTest": (context) => TextFieldTest(),
        "textFieldForm":(context) => TextFieldForm(),
        "linearLayout":(context) => LinearLayout(),
        "flexLayoutRoute":(context) => FlexLayoutTestRoute(),
        "specialLinearLayoutRoute":(context) => SpecialLinearLayoutRoute(),
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
            RaisedButton(
              child: Text("StateTest"),
              textColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, "show_snackBar");
              },
            ),
            RaisedButton(
              child: Text("父类管理状态"),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, "activeMangerByParent");
              },
            ),
            // 生成随机英文字符串
            RandomWordsWidget(),
            OutlineButton(
              child: Text("自定义button"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "customButton");
              },
            ),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("加载image"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.pushNamed(context, "imageTest");
              },
            ),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("部分控件在这里找"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.pushNamed(context, "elementTest");
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
