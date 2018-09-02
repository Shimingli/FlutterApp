//import 'package:flutter/material.dart';
//
//
///*
//使用 GestureDetector 我们可以监听广泛的手势，例如
//
//点击
//
//onTapDown 屏幕某一位置的手势按下事件。
//onTapUp 屏幕某一位置的手势抬起事件。
//onTap 屏幕某一位置的手势点击事件
//onTapCancel 只产生 onTapDown 却没有产生 onTapUp 的事件。
//双击
//
//onDoubleTap 用户在同一位置进行两次快速点击。
//长按
//
//onLongPress 长时间点按屏幕某一点时产生的事件。
//垂直拖动
//
//onVerticalDragStart 屏幕上某一点开始垂直移动的事件。
//onVerticalDragUpdate 屏幕上某一点垂直移动过程中的更新事件。
//onVerticalDragEnd 屏幕上某一点停止垂直移动后的事件。
//水平拖动
//
//onHorizontalDragStart 屏幕上某一点开始水平移动的事件。
//onHorizontalDragUpdate 屏幕上某一点水平移动过程中的更新事件。
//onHorizontalDragEnd 屏幕上某一点停止水平移动后的事件。
// */
//AnimationController controller;
//CurvedAnimation curve;
//@override
//void initState() {
//  // ignore: invalid_reference_to_this
//  controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
//  curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
//}
//
//class GestureDetectorPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        body: new Center(
//          child: new GestureDetector(
//            child: new RotationTransition(
//                turns: curve,
//                child: new FlutterLogo(
//                  size: 200.0,
//                )),
//            onDoubleTap: () {
//              if (controller.isCompleted) {
//                controller.reverse();
//              } else {
//                controller.forward();
//              }
//            },
//          ),
//        ));
//  }
//
//}
