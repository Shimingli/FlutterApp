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
    return new Text("dd");
  }

  Future getApiData() async {
    //豆瓣电影最近的正在播放的电影
    var url = "https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=100&client=somemessage&udid=dddddddddddddddddddddd";

//    Dio dio = new Dio();
//    Response response=await dio.get(url);
//    print(response.data);
////    setState(() {
////    });
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
    print(castsAcatars);
  }
}
