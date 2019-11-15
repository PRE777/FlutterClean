import 'package:flutter/material.dart'; //导入Material UI组件库

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
              // 路由跳转并传参 
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
  TipRoute({Key key, @required this.text // 接收一个text参数
      })
      : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
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