import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          new ThemeTestRoute(),
          new TextFieldDemo(),
          new FocusTestRoute(),
          
        ],
      )),
    );
  }
}

// TextField 属性练习
class TextFieldDemo extends StatefulWidget {
  @override
  TextFieldDemoState createState() => new TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final TextEditingController _userNameController = new TextEditingController();
  // 通过controller 监听文本变化
  @override
  void initState() {
    super.initState();
    _userNameController.addListener(() {
      print('监听：${_userNameController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: false, // 自动对焦
                  controller: _userNameController,
                  maxLength: 10, // 输入最大长度
                  maxLengthEnforced:
                      true, // true 超过最大输入长度禁止输入，false 超过最大长度可以输入，文本框会变红
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱", //类似于placeholder
                    prefixIcon: Icon(Icons.person),
                  ),
                  cursorColor: Colors.red, //光标颜色
                  cursorWidth: 5, //光标宽度
                  cursorRadius: Radius.circular(2), // 光标圆角
                  onChanged: (value) {
                    // 输入框内容改变时的回调函数
                    // print(value);
                  },
                  // onEditingComplete: (){
                  //   print(_userNameController.text);
                  // },
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    prefixIcon: Icon(Icons.lock),
                    enabled: true, // 禁用状态
                  ),
                  obscureText: true,// 密码不可见
                  onSubmitted: (v) {
                    print("密码为：$v");
                  },
                  onChanged: (value) {
                    // 输入框内容改变时的回调函数
                    print("密码：$value");
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("获取用户名"),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    print(_userNameController.text);
                  },
                ),
                RaisedButton(
                  child: Text("设置用户名"),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    _userNameController.text = "你猜我是谁";
                  },
                ),
                RaisedButton(
                  child: Text("选中用户名"),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    _userNameController.text = "小伙：该撸代码了！";
                    _userNameController.selection = TextSelection(
                      baseOffset: 3,
                      extentOffset: _userNameController.text.length,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 控制焦点,移动焦点
class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: false,
            focusNode: focusNode1, //关联focusNode1
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "用户名",
                hintText: "输入用户名",
                // 未获得焦点，下划线设置为 red
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                // 获取到焦点，下划线设置为 blue
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                )),
          ),
          TextField(
            focusNode: focusNode2,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.blue), // 设置字体颜色
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: "手机号",
              hintText: "输入手机号码",
              hintStyle: TextStyle(color: Colors.purple),
            ),
          ),
          Builder(builder: (tx) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                )
              ],
            );
          })
        ],
      ),
    );
  }
}

// 通过主题设置样式
class ThemeTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hintColor: Colors.grey[200],
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.red),
          hintStyle: TextStyle(color: Colors.purple,fontSize: 20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "请输入用户名或邮箱",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "请输入密码",
              prefixIcon: Icon(Icons.lock),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
              border: InputBorder.none, //隐藏下划线
            ),
          ),
        ],
      ),
    );
  }
}
