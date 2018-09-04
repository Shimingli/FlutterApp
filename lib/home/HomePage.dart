import 'package:flutter/material.dart';
import 'package:flutter_app/home/GestureDetectorPage.dart';
import 'package:flutter_app/home/OtherPage.dart';
import 'package:flutter_app/home/TabOne.dart';
import 'package:flutter_app/home/TabTwo.dart';
import 'package:flutter_app/utils/ToastUtil.dart';
// 麻痹这一行代码 还是我主动添加的  真的日了狗了
import 'package:fluttertoast/fluttertoast.dart';

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
    return new DefaultTabController(length: 3, child: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: titleWidget(),
        bottom: new TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            tabs: [new Tab(text: "TabOne",), new Tab(text: "TabTwo",)]),
      ),
      body: new TabBarView(children: [new TabOne(), new TabTwo()]),
    ));
  }


  Widget titleWidget() {
    return new Container(
        child: new Row(
          children: <Widget>[
            new Text("仕明同学", style: new TextStyle(
                color: Colors.blueGrey, letterSpacing: 1.00),),
            new Expanded(
                child: new FlatButton.icon(
                  // 点击事件
                    onPressed: () {
                      print("发生了点击事件");
                      Fluttertoast.showToast(
                          msg: "你点我干什么？",
                          // todo 这两个 打开属性 有点小问题
                          // ignore: ambiguous_import
                          //toastLength: Toast.LENGTH_SHORT,
                          // ignore: ambiguous_import
                         // gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          bgcolor: "#e74c3c",
                          textcolor: '#ffffff'
                      );
                      //todo  以下的实现估计有点问题
//                      ToastUtils.showToast(msg: "我是自定义实现的哦",
//                         // ignore: ambiguous_import
//                         //toastLength: Toast.LENGTH_SHORT,
//                          // ignore: ambiguous_import
//                          //gravity: ToastGravity.CENTER,
//                          //gravity: ToastGravity.BOTTOM, // ignore: ambiguous_import
//                          timeInSecForIos: 1,
//                          bgcolor: "#e74c3c",
//                          textcolor: '#ffffff'
//                      );
                      Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                        return new OtherPage();
                      }));
                    },
                    icon: new Icon(
                      Icons.pets,
                      color: Colors.amber,
                      size: 18.0,
                    ),
                    label: new Text(
                      "点我", style: new TextStyle(color: Colors.red),
                    )
                )
            ),
          ],
        ),
        decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: Colors.lightGreenAccent,
        )
    );
  }
}
