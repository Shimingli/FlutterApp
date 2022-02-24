import 'package:flutter/material.dart';
import 'package:flutter_app/home/GestureDetectorPage.dart';
import 'package:flutter_app/home/OtherPage.dart';
import 'package:flutter_app/home/TabFroth.dart';
import 'package:flutter_app/home/TabOne.dart';
import 'package:flutter_app/home/TabThree.dart';
import 'package:flutter_app/home/TabTwo.dart';
import 'package:flutter_app/utils/ToastUtil.dart';

// 麻痹这一行代码 还是我主动添加的  真的日了狗了
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

/**
 * 主页
 */
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //为给定的[子]控件创建默认选项卡控制器。
    return new DefaultTabController(
        length: 5,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.black45,
            // title: titleWidget(),
            title: new Text(
              "首页",
              style: new TextStyle(color: Colors.white, fontSize: 22.00),
            ),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.add_a_photo),
                  onPressed: () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (context) {
                      return new OtherPage();
                    }));
                  })
            ],
            bottom: new TabBar(
                isScrollable: true,
                labelStyle: new TextStyle(fontSize: 22.00, color: Colors.red),
                indicatorPadding: EdgeInsets.zero,
                labelColor: Colors.white,
                indicatorWeight: 4.0,
                unselectedLabelColor: Colors.blueAccent,
                tabs: [
                  new Tab(
                    text: "豆瓣电影",
                  ),
                  new Tab(
                    text: "控件摆放",
                  ),
                  new Tab(
                    text: "列表展示",
                  ),
                  new Tab(
                    text: "其他控件展示",
                  ),
                ]),
          ),
          body: new TabBarView(children: [
            new TabOne(),
            new TabTwo(),
            new TabThree(),
            new TabFroth()
          ]),
        ));
  }

  Widget titleWidget() {
    return new Container(
        child: new Row(
          children: <Widget>[
            new Text(
              "首页",
              style: new TextStyle(color: Colors.blueGrey, letterSpacing: 1.00),
            ),
            new Expanded(
                child: new FlatButton.icon(
                    // 点击事件
                    onPressed: () {
                      print("发生了点击事件");
                      Fluttertoast.showToast(
                          msg: "你点我干什么？",
                          // toastLength: Toast.LENGTH_SHORT,
                          // gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new OtherPage();
                      }));
                    },
                    icon: new Icon(
                      Icons.pets,
                      //color: Colors.amber,
                      size: 22.0,
                    ),
                    label: new Text(
                      "点我",
                      style: new TextStyle(color: Colors.red),
                    ))),
          ],
        ),
        decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: Colors.lightGreenAccent,
        ));
  }
}
