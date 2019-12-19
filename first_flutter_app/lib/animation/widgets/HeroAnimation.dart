import 'package:flutter/material.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero 动画"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.green[300],
              child: InkWell(
                child: Hero(
                  tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                  child: Image.asset(
                    "./images/avatar.png",
                    width: 200,
                  ),
                ),
                onTap: () {
                  pushFunc1("avatar", "./images/avatar.png", context);
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.red[300],
              child: InkWell(
                child: Hero(
                  tag: "gril", //唯一标记，前后两个路由页Hero的tag必须相同
                  child: Image.asset(
                    "./images/gril.png",
                    width: 200,
                  ),
                ),
                onTap: () {
                  pushFunc2("gril", "./images/gril.png", context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pushFunc1(String tag, String imagePath, BuildContext context) {
    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation animation, Animation secondaryAnimation) {
      return new FadeTransition(
        opacity: animation,
        child: Scaffold(
          appBar: AppBar(
            title: Text("原图"),
          ),
          body: HeroAnimationRouteB(tag: tag, imagePath: imagePath),
        ),
      );
    }));
  }

  void pushFunc2(String tag, String imagePath, BuildContext context) {
    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation animation, Animation secondaryAnimation) {
      return new FadeTransition(
        opacity: animation,
        child: HeroAnimationRouteC(tag: tag, imagePath: imagePath),
      );
    }));
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  HeroAnimationRouteB({
    Key key,
    @required this.imagePath,
    @required this.tag,
  });
  final String tag;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: tag, //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset(imagePath),
      ),
    );
  }
}

class HeroAnimationRouteC extends StatelessWidget {
  HeroAnimationRouteC({
    Key key,
    @required this.imagePath,
    @required this.tag,
  });
  final String tag;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: tag, //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset(imagePath),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
