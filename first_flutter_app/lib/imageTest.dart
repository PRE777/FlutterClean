import 'package:flutter/material.dart';
import 'myIcons.dart';

class ImageTestDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "自定义button",
        ),
      ),
      body: Center(
        child: new ImageContext(),
      ),
    );
  }
}

class ImageContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 加载本地图片
          // 方式一
          Image(
            image: AssetImage("images/avatar.png"),
            width: 150,
            height: 100,
            fit: BoxFit.fill,
          ),
          // 方式二
          Image.asset(
            "images/gril.png",
            width: 150,
            height: 120,
            fit: BoxFit.cover, //图片不会变形，超出显示空间部分会被剪裁。
          ),

          // 加载网络图片
          Image.network(
            "http://cdn.duitang.com/uploads/item/201601/12/20160112214812_4FN8C.jpeg",
            width: 100,
          ),
          Image.network(
            "http://cdn.duitang.com/uploads/item/201601/12/20160112214812_4FN8C.jpeg",
            width: 100,
            color: Colors.red,
            colorBlendMode: BlendMode.screen,
          ),
          Text(
            "\uE914",
            style: TextStyle(
                fontFamily: "MaterialIcons", fontSize: 30.0, color: Colors.red),
          ),
          Icon(
            Icons.accessible,
            color: Colors.green,
          ),
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          Icon(
            Icons.access_time,
            color: Colors.blue,
          ),
          Icon(
            IconData(
              0xe6ca,
              fontFamily: "customIcon",
            ),
            color: Colors.green,
            size: 30.0,
          ),
          Icon(
            MyCustomIcons.wechat,
            color: Colors.purpleAccent,
          )
        ],
      ),
    );
  }
}
