import 'package:flutter/material.dart';
import '../../models/index.dart';

class JsonModelTestRoute extends StatefulWidget {
  @override
  _JsonModelTestRouteState createState() => _JsonModelTestRouteState();
}

class _JsonModelTestRouteState extends State<JsonModelTestRoute> {
  bool _isCan = false;
  var _user;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userJson = {"name": "张三", "email": "12334@qq.com"};

    return Scaffold(
      appBar: AppBar(
        title: Text("Json Model 序列化"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("json数据序列化"),
              onPressed: () {
                try {
                  _user = _serializable(userJson);
                  print(_user.name);
                  setState(() {
                    _isCan = true;
                  });
                } catch (e) {} finally {}
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("json反序列化"),
              onPressed: !_isCan
                  ? null
                  : () {
                      var jsonData = _unSerializeble(_user);
                      print("${jsonData['email']}");
                    },
            ),
          ],
        ),
      ),
    );
  }
}

// 序列化
dynamic _serializable(Map<String, dynamic> jsonData) {
  // Map<String,dynamic> user = json.decode(jsonData);
  var user = new User.fromJson(jsonData);
  return user;
}

// 反序列化
dynamic _unSerializeble(User user) {
  Map<String, dynamic> jsonData = user.toJson();
  return jsonData;
}
