//  自定义路由切换动画
import 'package:flutter/material.dart';
import './AnimationStatusListen.dart';

class CustomTransitionAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义路由切换动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("渐隐渐入"),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    // transitionDuration: Duration(milliseconds: 300),
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return new FadeTransition(
                        opacity: animation,
                        child: AnimationListenTestRoute(),
                      );
                    },
                  ),
                );
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("缩放动画"),
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                  return new ScaleTransition(
                    scale: animation,
                    child: AnimationListenTestRoute(),
                  );
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("旋转动画"),
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                  return new RotationTransition(
                    turns: animation,
                    child: AnimationListenTestRoute(),
                  );
                }));
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
                Navigator.push(context, FadeRoute(builder: (context) {
                  return AnimationListenTestRoute();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //当前路由被激活，是打开新路由
    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      //是返回，则不应用过渡动画
      return Padding(padding: EdgeInsets.zero);
    }
  }
}

