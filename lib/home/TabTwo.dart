import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/bean/MovieBean.dart';

class TabTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabTwoState();
  }
}

class TabTwoState extends State<TabTwo> {
  List<MovieBean> datas = [];

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    var content;
    if (datas.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView(children: buildMovieItems());
    }
    return new Scaffold(
      body: content,
    );
  }

  Future getApiData() async {
    //豆瓣电影最近的正在播放的电影
    var url =
        "https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=100&client=somemessage&udid=dddddddddddddddddddddd";
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var jsonData = await response.transform(utf8.decoder).join();
      setState(() {
        datas = MovieBean.decodeData(jsonData);
      });
    }
    // ignore: argument_type_not_assignable
    print("第二页：" + datas[0].castsAcatars);
    List<String> split = datas[0].castsAcatars.split("****");
    for (int i = 0; i < split.length; i++) {
      print("第二页：" + split[i]);
    }
  }

// 每个条目的信息
  buildMovieItems() {
    List<Widget> widgets = [];
    for (int i = 0; i < datas.length; i++) {
      MovieBean data = datas[i];
      List<String> split = data.castsAcatars.split("****");
      var gd = new GestureDetector(
        onTap: () {
          // BindTab();
        },
        child: new Column(
          children: <Widget>[
            buildImage(split),
          //  new
          ],
        ),
      );
      widgets.add(gd);
    }
    return widgets;
  }

  buildImage(List<String> data) {
    return new Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 5.0,
        right: 5.0,
        bottom: 10.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.network(
            data[0],
            width:  MediaQuery.of(context).size.width / 3,
            height: 120.0,
          ),
          new Image.network(
            data[0],
            width:  MediaQuery.of(context).size.width / 3,
            height: 120.0,
          ),
          //if(data.length>1){
          new Image.network(
            data[0],
            width:  MediaQuery.of(context).size.width / 3,
            height: 120.0,
          ),
        ],
      ),
    );
  }
}
