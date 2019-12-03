import 'package:flutter/material.dart';

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,//是否固定在顶部
            expandedHeight: 250,
            floating: true, //是否随着滑动隐藏标题
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "./images/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.red[100*(index%10)],
                    child: Text("grid item $index"),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100*(index % 9)],
                  child: new Text("list item $index"),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
