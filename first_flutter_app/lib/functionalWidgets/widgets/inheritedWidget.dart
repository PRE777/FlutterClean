// 共享数据
import 'package:flutter/material.dart';

class ShareDataRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("共享数据"),
        ),
        body: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey[350],
                padding: EdgeInsets.all(10),
                child: new InheritedWidgetTestRoute(),
              ),
            )
          ],
        ));
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetState createState() => _InheritedWidgetState();
}

class _InheritedWidgetState extends State<InheritedWidgetTestRoute> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: _count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              // child:Text("$_count"),
              child: _TestWiget(),
            ),
            RaisedButton(
              child: Text("Increment"),
              color: Colors.green[400],
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () {
                setState(() {
                  ++_count;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

// 创建一个共享数据的组件 继承自 InheritedWidget
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    Key key,
    @required this.data,
    Widget child,
  }) : super(key: key, child: child);

  final int data; // 需要在子树中共享的数据，保存点击次数

  // 定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    // // 父widget发生变化时，子Widget会调用didChangeDependencies()方法和build()方法
    // return context.inheritFromWidgetOfExactType(ShareDataWidget);
    // 父widget发生变化时，子Widget不会调用didChangeDependencies()方法和build()方法
    // return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;
  }

  // 该回调决定当data发生变化时，是否通知子树中依赖data的子Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回true，则子树中依赖于(build函数中有调用)本widget的
    //子widget 的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
    // 值发生变化（true）则调用函数，未发生变化（false）则不会调用函数
  }
}

// 创建一个继承于ShareDataWidget 的子组件
class _TestWiget extends StatefulWidget {
  @override
  __TestWigetState createState() => new __TestWigetState();
}

class __TestWigetState extends State<_TestWiget> {
  @override
  Widget build(BuildContext context) {
    // 使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    // 可在此方法中执行一些昂贵操作，比如网络请求等，避免每次build()后执行昂贵操作
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}
