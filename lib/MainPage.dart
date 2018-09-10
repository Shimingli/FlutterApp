import 'package:flutter/material.dart';
import 'package:flutter_app/TabIconView.dart';
import 'package:flutter_app/home/HomePage.dart';
import 'package:flutter_app/my/MyPage.dart';
import 'package:flutter_app/official/OfficialNetWorkPage.dart';
import 'package:flutter_app/similarWords/SimilarWordsPage.dart';

/*
 * 从字面理解，StatelessWidget 是没有内部状态的即不可变。而 StatefulWidget 具有状态，即是可刷新的。
 * 当你构建的 UI 元素中有些部分是不变的，那么使用 StatelessWidget 是一个不错的选择(App log)
 */
class MainPage extends StatefulWidget {
  /*
  tatelessWidget 和 StatefulWidget 的核心内容是一致的，它们都会在每一帧中被重构，
  不同之处在于 StatefulWidget 有一个 State 对象，它可以为 StatefulWidget 在不同帧之间存储数据。
   */
//  @override
//  State<StatefulWidget> createState() {
//    return new MainPageState();
//  }
  @override
  State<StatefulWidget> createState() =>new MainPageState();
}
/**
 * HTTP 请求后获得的数据或用户交互来刷新 UI ，此时就需要使用
 * StatefulWidget 然后主动告诉 Flutter 底层 Widget 的状态发生了变化，只有如此 Flutter 才会刷新对应的 Widget
 */
class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List<TabIconView> tabIconViewArray;
  StatefulWidget currentPage;
  List<StatefulWidget> pageArray;
  int cuttentIndex = 0;

  //初始化State  有时候网络请求 也必须在这里面
  @override
  void initState() {
    super.initState();
    tabIconViewArray = <TabIconView>[
      new TabIconView(
        icon: new Icon(Icons.assignment),
        title: new Text("首页"),
        // ignore: argument_type_not_assignable
        vsync: this,
      ),
      new TabIconView(
        icon: new Icon(Icons.all_inclusive),
        title: new Text("寻找近义词"),
        vsync: this,//一定必须的要传入，要不然直接报错  todo   2018.9.4
      ),
    new TabIconView(icon: new Icon(Icons.open_with),title: new Text("官方Demo"),vsync: this)
      ,
      new TabIconView(
        icon: new Icon(Icons.people),
        title: new Text("关于我"),
        // ignore: argument_type_not_assignable
        vsync: this,
      )
    ];
    // 相当于 fore 的循环
    for (TabIconView view in tabIconViewArray) {
      view.controller.addListener(rebuild);
    }
    // 两个页面
    pageArray = <StatefulWidget>[
      new HomePage(),
      new SimilarWordsPage(),
      new OfficialNetWorkPage(),
      new MyPage()
    ];
    currentPage = pageArray[cuttentIndex];
  }

  void rebuild() {
    setState(() {

    });
  }

  //当该对象从树中永久移除时调用。
  @override
  void dispose() {
    super.dispose();
    // 相当于 垃圾的释放
    for (TabIconView view in tabIconViewArray) {
      view.controller.dispose();
    }
  }
  //  Flutter 中 UI 的布局是通过在 dart 文件中构建 Widget 树来实现的。
  // widget 相当于 View，Widget的实例仅仅存在每一帧之间，并且每一帧之间 Flutter都会主动的创建一颗Widget树用于下一帧的渲染。
  //Android 中 View 是可变的，在 Flutter 中的 Widget 是不可变的。这种特性使得 Flutter 中的 Widget 变得十分轻量级
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: currentPage,
        ),
        bottomNavigationBar: buildBar(),
      ),

      theme: new ThemeData.light(),
    );
  }

  buildBar() {
    return new BottomNavigationBar(
      items: tabIconViewArray.map((TabIconView view) => view.item).toList(),
      currentIndex: cuttentIndex,
      fixedColor: Colors.pink,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          tabIconViewArray[cuttentIndex].controller.reverse();
          cuttentIndex = index;
          tabIconViewArray[cuttentIndex].controller.forward();
          currentPage = pageArray[cuttentIndex];
        });
      },
    );
  }
}