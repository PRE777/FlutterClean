import 'package:flutter/material.dart';

class SwicthAndCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择器和复选框"),
      ),
      body: Center(
        child: new SwitchAndCheckBoxTestRoute(),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = false; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          activeColor: Colors.red,
          activeTrackColor: Colors.blue,
          inactiveThumbColor:Colors.orange,
          inactiveTrackColor:Colors.green,
          value: _switchSelected, //当前状态
          onChanged: (value) {
            //重新构建页面
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,// 选中时的颜色
          tristate: true, // 默认是false ，true 时 checkBox 有三个值可选 true false null
          onChanged: (value){
            print(value);
            setState(() {
              _checkboxSelected = value;
            });
          },
        ),
      ],
    );
  }
}
