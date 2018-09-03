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
  List<DataBean> datas=[];
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
//    return new Container(
//      child: new CustomButton("nihao"),
//    );

    return  new Scaffold(
//        appBar: new AppBar(
//          title: new Text("关于我",style: new TextStyle(color: Colors.purple),),
//        ),
        body: new ListView.builder(
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
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
        datas= DataBean.decodeData(jsonData);
      });
      for(int i=0;i<datas.length;i++){
        print(datas[i].key);
        print(datas[i].message);
      }
    }
  }
  Widget getRow(int i) {
    return new Padding(

        padding: new EdgeInsets.all(10.0),
       // child: new Text("Row ${datas[i].key}",style: new TextStyle(color: Colors.orange,fontSize: 18.00),)
      //  Column 相当于 相对布局  Row 线性布局
      child: new Column(

        children: <Widget>[
          // todo 要有一根线
          new Container(
          child: new Text("联想到的词："+datas[i].key,style: new TextStyle(color: Colors.purple,fontSize: 12.00),),
          padding: new EdgeInsets.all(10.0),
        ),new Container(
          child: new Text("联想到词的翻译信息："+datas[i].message,style: new TextStyle(color: Colors.cyan,fontSize: 15.00)),
          padding: new EdgeInsets.all(10.0),
        )
        ],
      ),

    );
  }
}
