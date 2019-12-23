import 'package:flutter/material.dart';

class GradientButtonTestRoute extends StatefulWidget {
  @override
  _GradientButtonTestRoute createState() => new _GradientButtonTestRoute();
}

class _GradientButtonTestRoute extends State<GradientButtonTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GradientButton"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal[300], Colors.teal[600]],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal[300], Colors.teal[600]],
                    ),
                  ),
                ),
              ),
              GradientButton(
                height: 50,
                child: Text("Submit"),
                onPressed: onTap,
                borderRadius: BorderRadius.circular(10),
                colors: [Colors.orange, Colors.red],
              ),
              GradientButton(
                height: 50,
                child: Text("Submit"),
                onPressed: onTap,
                borderRadius: BorderRadius.circular(10),
                colors: [Colors.blue, Colors.green],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap() {
    print("onTap");
  }
}

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.height,
    this.width,
    this.child,
    this.borderRadius,
    this.onPressed,
  });
  // 渐变色
  final List<Color> colors;
  // 按钮宽高
  final double height;
  final double width;

  final Widget child;
  final BorderRadius borderRadius;
  // 点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _colors,
        ),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
