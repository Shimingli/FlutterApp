import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/DataBean.dart';
import 'package:flutter_app/bean/MovieBean.dart';

class TabOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabOneState();
  }
}

class TabOneState extends State<TabOne> {
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

//    Dio dio = new Dio();
//    Response response=await dio.get(url);
//    print(response.data);
////    setState(() {
////   });
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var jsonData = await response.transform(utf8.decoder).join();
      setState(() {
        datas = MovieBean.decodeData(jsonData);
      });
    }
    var castsAcatars = datas[0].castsAcatars;
    print("castsAcatars");
    print("第一个条目的数据：" + castsAcatars);
  }

  // 每个条目的信息
  buildMovieItems() {
    List<Widget> widgets = [];
    for (int i = 0; i < datas.length; i++) {
      MovieBean data = datas[i];
      var gd = new GestureDetector(
        onTap: () {
          // BindTab();
        },
        child: new Column(
          children: <Widget>[
            //todo 在脑袋要构思出 这个布局的整体的结构
            new Row(
              children: <Widget>[
                buildImage(data),
                new Expanded(child: buildMsg(data)),
                const Icon(Icons.arrow_forward)
              ],
            ),
          ],
        ),
      );
      widgets.add(gd);
    }

    return widgets;
  }

  buildImage(MovieBean data) {
    return new Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: new Image.network(
        data.movieImages,
        width: 140.0,
        height: 160.0,
      ),
    );
  }

  buildMsg(MovieBean data) {
    return new Column(
      //每个孩子的边缘对其
      crossAxisAlignment: CrossAxisAlignment.start,
      //最大限度地减少自由空间沿主轴，受传入的布局限制。
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Text(
          data.movieName,
          textAlign: TextAlign.left,
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
        ),
        new Text("主演：" + data.castsName),
        new Text(data.title),
        new Text(data.total),
        new Text(data.ratingAverage),
        new Text(
          data.collect_count,
          style: new TextStyle(fontSize: 13.0, color: Colors.green),
        ),
      ],
    );
  }
}
