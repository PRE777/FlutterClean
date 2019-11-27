import 'package:flutter/material.dart';

class ContainerTestListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器类组件"),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new ContainerListRoute(),
          )
        ],
      ),
    );
  }
}

class ContainerListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Padding 填充"),
            textColor: Colors.white,
            color: Colors.blue[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "paddingContrainer");
            },
          ),
          RaisedButton(
            child: Text("constrainedBox 尺寸限制"),
            textColor: Colors.white,
            color: Colors.blue[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "constrainedBox");
            },
          ),
          RaisedButton(
            child: Text("transform变换"),
            textColor: Colors.white,
            color: Colors.blue[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "transformTestRoute");
            },
          ),
          RaisedButton(
            child: Text("Container 容器"),
            textColor: Colors.white,
            color: Colors.blue[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "containerTestRoute");
            },
          ),
           RaisedButton(
            child: Text("scaffold 导航"),
            textColor: Colors.white,
            color: Colors.blue[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "scaffold");
            },
          ), 
          RaisedButton(
            child: Text("裁剪 Clip"),
            textColor: Colors.white,
            color: Colors.blue[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "clipTestRoute");
            },
          ),
          
        ],
      ),
    );
  }
}
