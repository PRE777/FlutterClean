import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("对话框"),
        ),
        body: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[200],
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("对话框1"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () async {
                        var delete = await showDeleteConfirmDialog1(context);
                        if (delete == null) {
                          print("取消");
                        } else {
                          print("确认删除");
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text("对话框2"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        changeLanguage(context);
                      },
                    ),
                    RaisedButton(
                      child: Text("对话框3"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        showListDialog(context);
                      },
                    ),
                    RaisedButton(
                      child: Text("对话框4"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        showCustomDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("提示"),
                                content: Text("您确定要删除该选项吗？"),
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
                      },
                    ),
                    RaisedButton(
                      child: Text("复选框(可点击方式一))"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () async {
                        var delete = await showDeleteConfirmDialog2(context);
                        if (delete == null) {
                          print("取消删除");
                        } else {
                          print("确认删除，同时删除子目录：$delete");
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text("复选框(可点击方式二)"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () async {
                        var delete = await showDeleteConfirmDialog3(context);
                        if (delete == null) {
                          print("取消删除");
                        } else {
                          print("确认删除，同时删除子目录：$delete");
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text("底部菜单列表"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () async {
                        var index = _showModalBottomSheet(context);
                        if (index != null) {
                          print("选择第：$index 行");
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text("底部菜单列表"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print("1111111");
                        var aa = _showBottomSheet(context);
                        print(aa);
                      },
                    ),
                    RaisedButton(
                      child: Text("Loading框"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        showLoadingDialog(context);
                      },
                    ),
                    RaisedButton(
                      child: Text("日期选择样式一"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () async {
                        var date = await _showDatePicker(context);
                        if (date != null) {
                          print(date);
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text("日期选择样式二"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        _showDatePicker1(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

// AlertDialog
Future<bool> showDeleteConfirmDialog1(context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除该选项吗？"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
}

// SimpleDialog 提供列表
Future<void> changeLanguage(context) async {
  int i = await showDialog<int>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("请选择语言"),
          children: <Widget>[
            SimpleDialogOption(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text("中文简体"),
              ),
              onPressed: () {
                Navigator.of(context).pop(1);
              },
            ),
            SimpleDialogOption(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text("中文繁体"),
              ),
              onPressed: () {
                Navigator.of(context).pop(2);
              },
            ),
          ],
        );
      });
  switch (i) {
    case 1:
      print("中文简体");
      break;
    case 2:
      print("中文繁体");
      break;
    default:
      break;
  }
}

// Dialog
Future<void> showListDialog(context) async {
  int index = await showDialog(
    context: context,
    builder: (context) {
      var child = Column(
        children: <Widget>[
          ListTile(
            title: Text("请选择"),
          ),
          Expanded(
            child: ListView.builder(
              itemExtent: 50,
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () {
                    Navigator.of(context).pop(index);
                  },
                );
              },
            ),
          ),
        ],
      );
      return Dialog(
        child: child,
      );
      // return UnconstrainedBox(
      //   constrainedAxis: Axis.vertical,
      //   child: ConstrainedBox(
      //     constraints: BoxConstraints(maxWidth: 280),
      //     child: Material(
      //       child: child,
      //       type: MaterialType.card,
      //     ),
      //   ),
      // );
    },
  );
  if (index != null) {
    print("选择了：$index");
  }
}

// 自定义对话框效果
Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true, //点击遮罩是否关闭对话框
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.green.withAlpha(150),
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions, // 对话框打开/关闭的动画
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

// 复选框对话窗方式一
Future<bool> showDeleteConfirmDialog2(context) {
  bool _withChecked = false; //记录复选框是否选中
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // 尽可能小的占用主轴空间
            children: <Widget>[
              Text("您确定要删除该选项吗？"),
              Row(
                children: <Widget>[
                  Text("是否删除子目录？"),
                  DialogChexkbox(
                    value: _withChecked, // 默认不选中
                    onCheckboxChanged: (bool value) {
                      // 更新选中状态
                      _withChecked = value;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                print("_withChecked:$_withChecked");
                Navigator.of(context).pop(_withChecked);
              },
            ),
          ],
        );
      });
}

// 复选框对话窗方式二
Future<bool> showDeleteConfirmDialog3(context) {
  bool _withChecked = false; //记录复选框是否选中
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // 尽可能小的占用主轴空间
            children: <Widget>[
              Text("您确定要删除该选项吗？"),
              Row(
                children: <Widget>[
                  Text("是否删除子目录？"),
                  Builder(
                    builder: (context) {
                      return Checkbox(
                        value: _withChecked,
                        onChanged: (value) {
                          (context as Element).markNeedsBuild();
                          _withChecked = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                print("_withChecked:$_withChecked");
                Navigator.of(context).pop(_withChecked);
              },
            ),
          ],
        );
      });
}

//复选框对话窗方式一  单独抽离出StatefulWidget
class DialogChexkbox extends StatefulWidget {
  DialogChexkbox({
    Key key,
    this.value,
    @required this.onCheckboxChanged,
  });
  final bool value;
  final ValueChanged<bool> onCheckboxChanged;

  @override
  _DialogChexkboxState createState() => new _DialogChexkboxState();
}

class _DialogChexkboxState extends State<DialogChexkbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      checkColor: Colors.red,
      activeColor: Colors.green,
      onChanged: (v) {
        widget.onCheckboxChanged(v);
        setState(() {
          value = v;
        });
      },
    );
  }
}

// 底部菜单列表
Future<int> _showModalBottomSheet(context) {
  return showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: 20,
          itemExtent: 44,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                Navigator.of(context).pop(index);
              },
            );
          },
        );
      });
}

// PersistentBottomSheetController
PersistentBottomSheetController<int> _showBottomSheet(context) {
  return showBottomSheet<int>(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: 20,
          itemExtent: 44,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                Navigator.of(context).pop(index);
              },
            );
          },
        );
      });
}

//  loading 框
Future showLoadingDialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("正在加载,请稍后…"),
                  )
                ],
              ),
            ),
          ),
        );
        // return
      });
}

// 日期选择
Future<DateTime> _showDatePicker(context) {
  var date = new DateTime.now();
  return showDatePicker(
    context: context,
    initialDatePickerMode: DatePickerMode.day,
    initialDate: date,
    firstDate: DateTime(date.year - 5),
    locale: Locale("zh"),
    lastDate: date.add(
      // 未来30天可选
      Duration(days: 30),
    ),
  );
}

// 日期选择
Future<DateTime> _showDatePicker1(context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(Duration(days: 30)),
            maximumYear: date.year + 1,
            use24hFormat: true, //24小时制
            minuteInterval: 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      });
}
