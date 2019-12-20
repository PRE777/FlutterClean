import 'package:flutter/material.dart';

class AnimationEntranceRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("动画基本结构"),
                    onPressed: () {
                      Navigator.pushNamed(context, "animationBaseStructure");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("动画状态监听"),
                    onPressed: () {
                      Navigator.pushNamed(context, "animationStatusListen");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("自定义路由动画"),
                    onPressed: () {
                      Navigator.pushNamed(context, "animationRoute");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("Hero 动画"),
                    onPressed: () {
                      Navigator.pushNamed(context, "heroAnimation");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("stagger 交错动画"),
                    onPressed: () {
                      Navigator.pushNamed(context, "staggerAnimation");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("切换动画（switcher）"),
                    onPressed: () {
                      Navigator.pushNamed(context, "animatedSwitcher");
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("过渡动画"),
                    onPressed: () {
                      Navigator.pushNamed(context, "animationTransition");
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
