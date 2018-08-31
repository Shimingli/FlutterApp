import 'package:flutter/material.dart';
import 'package:flutter_app/home/TabOne.dart';
import 'package:flutter_app/home/TabTwo.dart';


/**
 * 主页
 */
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    //为给定的[子]控件创建默认选项卡控制器。
    return new DefaultTabController(length: 3, child: new Scaffold(
       appBar: new AppBar(
         backgroundColor: Colors.red,
         title: new Text("仕明同学"),
         bottom: new TabBar(
             labelColor: Colors.green,
             unselectedLabelColor: Colors.black,
             tabs: [new Tab(text: "TabOne",),new Tab(text: "TabTwo",)]),
       ),
      body: new TabBarView(children: [new TabOne(),new TabTwo()]),
    ));
  }
}
