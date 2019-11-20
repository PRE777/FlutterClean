import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "自定义button",
          style: TextStyle(color: Colors.orange, fontSize: 25.0),
        ),
      ),
      body: Center(
        child: new ButtonContext(),
      ),
    );
  }
}

class ButtonContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text(
              "FlatButton扁平按钮",
              style: TextStyle(color: Colors.green, fontSize: 22.0),
            ),
            onPressed: () {
              print("flatButtonClicked");
            },
          ),
          RaisedButton(
            child: Text(
              "RaisedButton 漂浮按钮",
              style: TextStyle(
                color: Colors.red,
                fontSize: 19.0,
              ),
            ),
            onPressed: () {
              print("RaisedButton");
            },
          ),
          OutlineButton(
            child: Text("OutlineButton"),
            textColor: Colors.blue,
            onPressed: () {
              print("OutlineButton");
            },
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text("发送"),
            onPressed: () {},
          ),
          FlatButton.icon(
            icon: Icon(Icons.add),
            label: Text("添加"),
            onPressed: () {},
          ),
          OutlineButton.icon(
            icon: Icon(Icons.info),
            label: Text("详情"),
            onPressed: () {},
          ),

          // 自定义按钮外观

          FlatButton(
            color: Colors.blue,//按钮背景颜色
            highlightColor: Colors.blue[700],
            textColor: Colors.white,
            splashColor: Colors.grey, // 点击时，水波动画中水波的颜色
            colorBrightness:Brightness.dark,//按钮主题，默认是浅色主题 dark light
            child: Text("submit"),// 按钮的内容
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: (){},
          ),
          RaisedButton(
            color: Colors.blue,//按钮背景颜色
            highlightColor: Colors.blue[700],
            textColor: Colors.white,
            splashColor: Colors.grey, // 点击时，水波动画中水波的颜色
            colorBrightness:Brightness.dark,//按钮主题，默认是浅色主题 dark light
            child: Text("submit"),// 按钮的内容
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            elevation: 1.0, // 正常状态下阴影
            highlightElevation: 1.0,// 按下时的阴影
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
