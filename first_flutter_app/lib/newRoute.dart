import 'package:flutter/material.dart'; //导入Material UI组件库

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
        // title: Text(widget.title),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}