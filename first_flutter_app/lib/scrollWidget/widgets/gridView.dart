import 'package:flutter/material.dart';

// GridView都需要一个widget数组作为其子元素，
// 这些方式都会提前将所有子widget都构建好，
// 所以只适用于子widget数量比较少时


class GridViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          // 1、SliverGridDelegateWithFixedCrossAxisCount
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green[100],
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2, // 宽高比
                ),
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast),
                ],
              ),
            ),
          ),
          // 2、GridView.count
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow[200],
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 2,// 宽高比
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast),
                ],
              ),
            ),
          ),

          // 3、SliverGridDelegateWithMaxCrossAxisExtent
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red[100],
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100.0,
                  childAspectRatio: 2.0, // 宽高比
                ),
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast),
                ],
              ),
            ),
          ),
          // 4. GridView.Extent
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.purple[200],
              child: GridView.extent(
                maxCrossAxisExtent: 120,
                childAspectRatio: 2.0,
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
