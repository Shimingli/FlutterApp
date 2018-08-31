import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TabIconView {
  TabIconView({
    //在 Flutter 中对应 View 的是 Widget
    Widget icon,
    Widget title,
    //任何想要在帧触发时得到通知的对象都可以使用Ticker，但是最常用的是通过[AnimationController]间接使用的
    TickerProvider vsync
  }):
  // 底部导航栏
  item=new BottomNavigationBarItem(icon: icon, title: title),
  //kThemeAnimationDuration  默认情况下主题改变动画的持续时间。
  //创建动画控制器。
  controller=new AnimationController(duration: kThemeAnimationDuration,vsync: vsync);

  final BottomNavigationBarItem item;
  final AnimationController controller;


}