// 跨页面事件通知
import 'package:flutter/material.dart';

var bus = new EventBus();

class EventBusTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    test(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("事件总线"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow[200],
              child: Center(
                child: RaisedButton(
                  child: Text("data"),
                  onPressed: () {
                    bus.emit("test");
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(),
          ),
          Expanded(
            flex: 1,
            child: Center(),
          ),
        ],
      ),
    );
  }

  void test(context) {
    bus.on("test", (e) {
      showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("提示"),
              content: Text("您确定要删除该选项吗？"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actions: <Widget>[
                FlatButton(
                  child: Text("取消"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("确定"),
                  onPressed: () {
                    //关闭对话框并返回true
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          });
    });
  }
}

typedef void EventCallback(arg);

class EventBus {
  // 工厂模式 : 单例公开访问点
  factory EventBus() => _getInstance();

  // 静态私有成员，没有初始化
  static EventBus _instance;

  // 私有构造函数
  EventBus._internal() {
    // 初始化
  }
  // 静态、同步、私有访问点
  static EventBus _getInstance() {
    if (_instance == null) {
      _instance = new EventBus._internal();
    }
    return _instance;
  }

//保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _emap = new Map<Object, List<EventCallback>>(); // 就一字典
  //添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }

  //移除订阅者
  void off(eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }
}
