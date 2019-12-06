// 跨组件状态共享
import 'dart:collection';

import 'package:flutter/material.dart';

class ProviderTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跨组件状态共享"),
      ),
      body: Center(
        child: new ProviderRoute(),
      ),
    );
  }
}

// 功能型组件
//  一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);
  // 共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    // 在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

// 该方法用于在Dart中获取模板类型
Type _typeOf<T>() => T;

// 我们将要共享的状态放到一个<T extends ChangeNotifier> Model 类中，然后让它继承自ChangeNotifier
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });
  final Widget child;
  final T data;
  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider =
        context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    // 如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() {});
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    // 当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
// 购物车实例

class Item {
  Item(this.price, this.count);
  double price; // 商品价格
  int count; // 商品数量
}

// 定义一个保存购物车内商品数据的model,共享数据_item保存到model中
class CartModel extends ChangeNotifier {
  // 保存购物车中商品列表
  final List<Item> _items = [];
  // 禁止修改购物车中商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  // 购物车中商品总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);
  double get totalCount => _items.fold(0, (value, item) => value + item.count);
  // 将[item]添加到购物车，这是唯一一种能从外部改变购物车的操作
  void add(Item item) {
    _items.add(item);
    // 通过监听器（订阅者），重构InheritedProvider，更新状态
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => new _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        data: CartModel(),
        child: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                var cart = ChangeNotifierProvider.of<CartModel>(context);
                return Text("总价：${cart.totalPrice}--总数：${cart.totalCount}");
              },
            ),
            Builder(
              builder: (context) {
                print("RaisedButton build"); // 在后面优化部分会用到
                return RaisedButton(
                  child: Text("添加商品"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    var cart = ChangeNotifierProvider.of<CartModel>(context);
                    cart.add(Item(20.0, 1));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
