import 'package:first_flutter_app/elements/textFieldTest.dart';
import 'package:flutter/material.dart'; //导入Material UI组件库
import 'package:flutter_localizations/flutter_localizations.dart'; // 国际化
import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';

// import 'package:english_words/english_words.dart';

import 'routerTest.dart';
import 'newRoute.dart';
import 'english_word_test.dart';
import 'show_snackBar.dart';
import 'activeMangerByParent.dart';
import 'customButton.dart';
import 'imageTest.dart';
import 'elementTest.dart';
import 'elements/switchAndCheckbox.dart';
import 'elements/textFieldTest.dart';
import 'elements/textFieldForm.dart';

// 布局类组件
import 'elements/linearLayout.dart';
import 'elements/flexLayoutRoute.dart';
import 'elements/wrapFlowLayout.dart';
import 'elements/stackPositionRouter.dart';
import 'elements/alignLayout.dart';

// 容器类组件
import 'containerWidget/containerEntrance.dart';
import 'containerWidget/elements/paddingContrainer.dart';
import 'containerWidget/elements/constrainedBox.dart';
import 'containerWidget/elements/transform.dart';
import 'containerWidget/elements/container.dart';
import 'containerWidget/elements/scaffold.dart';
import 'containerWidget/elements/clip.dart';

// 可滚动组件
import 'scrollWidget/scrollEntrance.dart';
import 'scrollWidget/widgets/singleChildScrollView.dart';
import 'scrollWidget/widgets/listView.dart';
import 'scrollWidget/widgets/gridView.dart';
import 'scrollWidget/widgets/gridView1.dart';
import 'scrollWidget/widgets/sliverScrollView.dart';
import 'scrollWidget/widgets/scrollController.dart';
import 'scrollWidget/widgets/scrollNotification.dart';

// 功能类组件
import 'functionalWidgets/functionalEntrance.dart';
import 'functionalWidgets/widgets/willPopScope.dart';
import 'functionalWidgets/widgets/inheritedWidget.dart';
import 'functionalWidgets/widgets/provider.dart';
import 'functionalWidgets/widgets/changeTheme.dart';
import 'functionalWidgets/widgets/asyncUpdateUI.dart';
import 'functionalWidgets/widgets/alertDialog.dart';
// 事件处理与通知
import 'eventNotification/entrance.dart';
import 'eventNotification/widgets/originalEvent.dart';
import 'eventNotification/widgets/gesture.dart';
import 'eventNotification/widgets/gestureArenaConflict.dart';
import 'eventNotification/widgets/eventBus.dart';
import 'eventNotification/widgets/notification.dart';

// 动画
import 'animation/entrance.dart';
import 'animation/widgets/AnimationBaseStructure.dart';
import 'animation/widgets/AnimationStatusListen.dart';
import 'animation/widgets/AnimationRoute.dart';
import 'animation/widgets/HeroAnimation.dart';
import 'animation/widgets/staggerAnimation.dart';
import 'animation/widgets/AnimatedSwitcher.dart';
import 'animation/widgets/AnimationTransition.dart';

// 自定义组件
import 'customWidget/entrance.dart';
import 'customWidget/widgets/gradientButton.dart';
import 'customWidget/widgets/turnBox.dart';
import 'customWidget/widgets/customPaintCanvar.dart';
import 'customWidget/widgets/gradientCircularProgress.dart';
import 'customWidget/widgets/customDemo.dart';

// 文件操作与网络请求
import 'fileAndConnect/entrance.dart';
import 'fileAndConnect/widgets/fileOperation.dart';
import 'fileAndConnect/widgets/httpClient.dart';
import 'fileAndConnect/widgets/dio_Http.dart';
import 'fileAndConnect/widgets/downloadWithChunks.dart';
import 'fileAndConnect/widgets/webScoket.dart';
import 'fileAndConnect/widgets/jsonModel.dart';

// 包与插件
import 'package/entrance.dart';
import 'package/widgets/flutterPackage.dart';
import 'package/widgets/cameraRoute.dart';
import 'package/widgets/platformView.dart';

List<CameraDescription> cameras;
void main() async {
  // 获取可用摄像头列表，cameras为全局变量
  runApp(MyApp()); // 应用入口
  try {
    cameras = await availableCameras();
  } catch (e) {
    print(e.toString());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Flutter Demo', //应用名称
      theme: ThemeData(
        // 这是应用程序的主题
        brightness: Brightness.light,
        // primaryColor: Colors.black,// 主题颜色primaryColor 优先级高于主题样本primarySwatch
        primarySwatch: Colors.teal,
        // hintColor: Colors.red,
      ),
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      //应用首页路由
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // 注册路由表
      routes: {
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由

        "new_page": (context) => NewRoute(),
        "routerTest_page": (context) => RouterTestRoute(),
        "show_snackBar": (context) => MyStateTestPage(),
        "activeMangerByParent": (context) => ParentMangerTest(),
        "customButton": (context) => CustomButton(),
        "imageTest": (context) => ImageTestDart(),
        "elementTest": (context) => ElementTest(),
        "swicthAndCheckbox": (context) => SwicthAndCheckbox(),
        "textFieldTest": (context) => TextFieldTest(),
        "textFieldForm": (context) => TextFieldForm(),
        "linearLayout": (context) => LinearLayout(),
        "flexLayoutRoute": (context) => FlexLayoutTestRoute(),
        "wrapFlowLayout": (context) => WrapFlowLayoutTestRoute(),
        "specialLinearLayoutRoute": (context) => SpecialLinearLayoutRoute(),
        "stackPositionTestRoute": (context) => StackPositionTestRoute(),
        "alignLayoutTestRoute": (context) => AlignLayoutTestRoute(),
        "tipRoute_page": (context) =>
            TipRoute(text: ModalRoute.of(context).settings.arguments),

        // 容器类组件
        "containerEntrance": (context) => ContainerTestListRoute(),
        "paddingContrainer": (context) => PaddingTestRoute(),
        "constrainedBox": (context) => ConstrainedBoxTestRoute(),
        "transformTestRoute": (context) => TransformTestRoute(),
        "containerTestRoute": (context) => ContainerTestRoute(),
        "clipTestRoute": (context) => ClipTestRoute(),
        "scaffold": (context) => ScaffoldRoute(),

        // 可滚动组件
        "scrollWidget": (context) => ScrollWidget(),
        "singleChildScrollView": (context) => SingleChildScrollTestRoute(),
        "listView": (context) => ListViewTestRoute(),
        "gridView": (context) => GridViewTestRoute(),
        "gridView1": (context) => DynamicGridViewTestRoute(),
        "customScrollView": (context) => CustomScrollViewTestRoute(),
        "scrollController": (context) => ScrollControllerTestRoute(),
        "scrollNotification": (context) => ScrollNotificationTestRoute(),

        // 功能类型组件
        "functionalWidgets": (context) => FunctionalWidget(),
        "willPopScope": (context) => WillPopScopeTestRoute(),
        "shareDataRoute": (context) => ShareDataRoute(),
        "provider": (context) => ProviderTestRoute(),
        "changeTheme": (context) => ChangeThemeTestRoute(),
        "asyncUpdateUI": (context) => AsyncUpdateUITestRoute(),
        "alert": (context) => AlertTestRoute(),

        // 事件处理与通知
        "enventNotification": (context) => EnventNotificationRoute(),
        "originalEvent": (context) => PointerEventTestRoute(),
        "gestureTest": (context) => GestureTestRoute(),
        "gestureArenaConflict": (context) => GestureArenaConflictRoute(),
        "eventBus": (context) => EventBusTestRoute(),
        "notification": (context) => NotificationTestRoute(),

        // 动画
        "animationEntrance": (context) => AnimationEntranceRoute(),
        "animationBaseStructure": (context) => AnimationTestRoute(),
        "animationStatusListen": (context) => AnimationListenTestRoute(),
        "animationRoute": (context) => CustomTransitionAnimationRoute(),
        "heroAnimation": (context) => HeroAnimationRoute(),
        "staggerAnimation": (context) => StaggerAnimationRoute(),
        "animatedSwitcher": (context) => AnimatedSwitcherRoute(),
        "animationTransition": (context) => AnimatedTransitionRoute(),

        // 自定义组件
        "customWidgetEntrance": (context) => CustomWidgetEntranceRoute(),
        "gradientButton": (context) => GradientButtonTestRoute(),
        "turnBox": (context) => TurnBoxTextRoute(),
        "customPaintCanvar": (context) => CustomPaintCanvarRoute(),
        "gradientCircularProgress": (context) =>
            GradientCircularProgressRoute(),
        "customDemo": (context) => CustomDemoRoute(),
        // 文件操作与网络请求
        "fileAndConnectEntrance": (context) => FileAndConnectEntranceRoute(),
        "fileOperation": (context) => FileOperationRoute(),
        "httpClient": (context) => HttpClientTextRoute(),
        "dio_httpRequest": (context) => DioHttpTestRoute(),
        "downloadWithChunks": (context) => DownLoadWithChunks(),
        "webSocket": (context) => WebSocketTestRoute(),
        "json_Model": (context) => JsonModelTestRoute(),

        // 包与插件
        "packageEntrance": (context) => PackageEntranceRoute(),
        "batterylevel": (context) => BatterylevelTestRoute(),
        "cameraRoute": (context) => CameraExampleHome(),
        "platformView": (context) => PlatformViewRoute(),
      },
    );
    return materialApp;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// _MyHomePageState类是继承MyHomePage类对应的State(状态)类
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("flutter1.9之后，iOS项目默认为swift,"),
            Text("终端中执行 'flutter create -i objc + 工程名' ，创建oc"),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text(
                "open new route",
              ),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, "new_page");
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return NewRoute();
                //   },
                // ));
              },
            ),
            FlatButton(
              child: Text("RouterTestRoute"),
              textColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, "routerTest_page");
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return RouterTestRoute();
                // }));
              },
            ),
            RaisedButton(
              child: Text("StateTest"),
              textColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, "show_snackBar");
              },
            ),
            RaisedButton(
              child: Text("父类管理状态"),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, "activeMangerByParent");
              },
            ),
            // 生成随机英文字符串
            RandomWordsWidget(),
            OutlineButton(
              child: Text("自定义button"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "customButton");
              },
            ),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("加载image"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.pushNamed(context, "imageTest");
              },
            ),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("部分控件在这里找"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.pushNamed(context, "elementTest");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
