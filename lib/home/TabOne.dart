import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/bean/DataBean.dart';
import 'package:flutter_app/widget/CustomButton.dart';

class TabOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabOneState();
  }
}

class TabOneState extends State<TabOne> {
  @override
  void initState() {
    super.initState();
    //http://dict-mobile.iciba.com/interface/index.php?c=word&m=getsuggest&nums=10&client=6&is_need_mean=1&word=sm
    //我的 Api的地址
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    //return new Text("nihao");
    // api 的接口在这里哦  https://github.com/jokermonn/-Api/blob/master/KingsoftDic.md
    return new Container(
      child: new CustomButton("nihao"),
    );
  }

  // 网络请求
  void getApiData() async {
    // 注意导入的包的地方是  import 'dart:io';
    var httpClient = new HttpClient();
    var url =
        "http://dict-mobile.iciba.com/interface/index.php?c=word&m=getsuggest&nums=10&client=6&is_need_mean=1&word=sm";
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var jsonData = await response.transform(utf8.decoder).join();
      setState(() {
        //print(jsonData);
        DataBean.decodeData(jsonData);
      });
    }
  }
}
