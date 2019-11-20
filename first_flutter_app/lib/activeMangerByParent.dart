// 父类去管理状态
import 'package:flutter/material.dart';

class ParentMangerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("父类管理状态",style: TextStyle(
          color:Colors.red,
          fontSize: 18.0,
          height: 0.1,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed,
        ),),
      ),
      body: Center(
        child: new ParentWidget(),
      ),
    );
  }
}


class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTextBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTextBoxChanged,
      ) ,
    );
  } 
}

// 
class TapboxB  extends StatelessWidget {
  TapboxB({Key key,this.active:false,@required this.onChanged}) : super(key:key);
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap(){
    onChanged(!active);
  }
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.red),
          )
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color:active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }

}
