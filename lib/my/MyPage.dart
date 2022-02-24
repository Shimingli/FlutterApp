import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "关于我",
          style: new TextStyle(color: Colors.purple),
        ),
      ),
      body: findBody(),
    );
  }

  findBody() {
    return new ListView(
      children: <Widget>[
        new Text(
          "GitHub:https://github.com/Shimingli",
          style: new TextStyle(color: Colors.lightBlue, fontSize: 18.0),
        ),
        new AspectRatio(
          child: new Container(
            foregroundDecoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(
                      "https://upload-images.jianshu.io/upload_images/5363507-ff86aa4df080c21f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"),
                  centerSlice: new Rect.fromLTRB(400.0, 400.0, 1360.0, 1500.0),
                ),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(6.0))),
          ),
          aspectRatio: 3.0 / 2.0,
        ),
        new Text(
          "简书:https://www.jianshu.com/",
          style: new TextStyle(color: Colors.lightBlue, fontSize: 18.0),
        ),
        new AspectRatio(
          child: new Container(
            foregroundDecoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(
                      "https://upload-images.jianshu.io/upload_images/5363507-b3550172157c83d2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"),
                  centerSlice: new Rect.fromLTRB(400.0, 400.0, 1360.0, 1500.0),
                ),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(6.0))),
          ),
          aspectRatio: 3.0 / 2.0,
        ),
      ],
    );
  }
}
