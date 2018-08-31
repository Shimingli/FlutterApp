import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
一个小小的Demo
 */
class OtherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new OtherPageState();
  }
}

class OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    //要充分利用应用程序中的 Material 风格的组件的话，可以把顶级部件 MaterialApp 作为应用程序的入口。MaterialApp 作为一个比较方便的部件，包装了许多实现了 Material 风格所需要的部件（如 Scaffold ）。MaterialApp 是在 WidgetsApp 的基础上进行实现的
    return new MaterialApp(
      theme: new ThemeData.light(),
      home: new Scaffold(
        appBar: findAppBar(),
        body: findBody(),
      ),

    );
  }

  findAppBar() {
    return new AppBar(
      title: new Container(
        child: new Row(
          children: <Widget>[
            new Container(
              child: new FlatButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: new Icon(Icons.cancel, color: Colors.red,),
                  label: new Text("退出")
              ),
              width: 120.0,
            ),
            new Expanded(child: new TextField(
              autofocus: true, //自动获取键盘，键盘弹起来
              decoration: new InputDecoration.collapsed(hintText: "我是edittext",
                  hintStyle: new TextStyle(color: Colors.black)),
            ))

          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white10,
            borderRadius: const BorderRadius.all(const Radius.circular(3.0))
        ),
      ),
    );
  }

  findBody() {
    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Text("文本", style: new TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0)),
            margin: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
            alignment: Alignment.topLeft,
          ),
          new Row(
            children: <Widget>[
              new Container(
                child: new Chip(
                  label: new FlatButton(onPressed: () {},
                      child: new Text(
                        "你好Flutter", style: new TextStyle(color: Colors.red),)),
                  backgroundColor: Colors.yellow,
                ),
                margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                alignment: Alignment.topLeft,
              ),
              new Container(
                child: new Chip(
                  label: new FlatButton(onPressed: () {},
                      child: new Text("你好Flutter",
                          style: new TextStyle(color: Colors.red))),
                  backgroundColor: Colors.blue,
                ),
                margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                alignment: Alignment.topLeft,
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                child: new Chip(
                  label: new FlatButton(onPressed: () {},
                      child: new Text("你好Flutter",
                          style: new TextStyle(color: Colors.red))),
                  backgroundColor: Colors.black,
                ),
                margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                alignment: Alignment.topLeft,
              ),
            ],
          ),
          new Container(
            child: new Text("文本T", style: new TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0)),
            margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            alignment: Alignment.topLeft,
          ),
          new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new Icon(
                      Icons.accessibility, color: Colors.pink, size: 16.0),
                  margin: const EdgeInsets.only(right: 12.0),
                ),
                new Expanded(
                  child: new Container(
                    child: new Text("test", style: new TextStyle(
                        color: Colors.purple, fontSize: 14.0),),
                  ),
                ),
                new Container(
                  child: new GestureDetector(
                    child: new Icon(Icons.clear, color: Colors.red, size: 32.0),
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "删除不掉的，我是点击事件的第二种实现的方式",
                          timeInSecForIos: 1,
                          bgcolor: "#e74c3c",
                          textcolor: '#ffffff'
                      );
                    },
                  ),
                )
              ],
            ),
            margin: const EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 10.0),
            padding: const EdgeInsets.only(bottom: 10.0),
            decoration: new BoxDecoration(
                border: new BorderDirectional(
                    bottom: new BorderSide(color: Colors.black12))
            ),
          ),

          new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: "问题1",
                        hintStyle: new TextStyle(color: Colors.black)
                    ),
                  ),
                  margin: const EdgeInsets.all(16.0),
                ),
                new Container(
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: "问题1",
                        hintStyle: new TextStyle(color: Colors.black)
                    ),
                  ),
                  margin: const EdgeInsets.all(16.0),
                ),
                new Container(
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: "问题1",
                        hintStyle: new TextStyle(color: Colors.black)
                    ),
                  ),
                  margin: const EdgeInsets.all(16.0),
                ),
                new Container(
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: "问题1",
                        hintStyle: new TextStyle(color: Colors.black)
                    ),
                  ),
                  margin: const EdgeInsets.all(16.0),
                ),
                new Container(
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: "问题1",
                        hintStyle: new TextStyle(color: Colors.black)
                    ),
                  ),
                  margin: const EdgeInsets.all(16.0),
                ),
                new Container(
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: "问题1",
                        hintStyle: new TextStyle(color: Colors.black)
                    ),
                  ),
                  margin: const EdgeInsets.all(16.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}