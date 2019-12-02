import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  List tabs = ["关注", "推荐", "热点"];

  @override
  void initState() {
    super.initState();
    // 创建controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: AppBar(
        title: Text("菜单栏"),
        // 添加按钮
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => {
              Navigator.pop(context,""),
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          )
        ],
        // 自定义菜单按钮（触发抽屉的按钮）
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      // 左侧抽屉
      drawer: new MyDrawer(),
      // 底部导航
      bottomNavigationBar:
          // 自定义tabBar
          // BottomAppBar(
          //   color: Colors.white,
          //   shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          //   child: Row(
          //     children: <Widget>[
          //       IconButton(icon: Icon(Icons.home), onPressed: () {}),
          //       SizedBox(),
          //       IconButton(icon: Icon(Icons.person), onPressed: () {})
          //     ],
          //     mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
          //   ),
          // ),
          BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("主页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("收藏")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("个人")),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemClicked,
        fixedColor: Colors.green,
      ),
      // 悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          // 创建3个tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 4),
          );
        }).toList(),
      ),
    );
  }

  void _onItemClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

// 抽屉界面
class MyDrawer extends StatelessWidget {
  // const MyDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // 移除抽屉菜单顶部默认留白
        removeTop: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/gril.png",
                        width: 80.0,
                      ),
                    ),
                  ),
                  Text(
                    "周星星",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add Account"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Manage Account"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
