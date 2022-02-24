import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DataBean {
  final String key;
  final String message;

  DataBean(this.message, this.key);

  static List<DataBean> datas = <DataBean>[];

  //转化data
  static List<DataBean> decodeData(String data) {
    datas.clear();
    var newData = json.decode(data);
    var results = newData['message'];
    if (results.length == 0) {
      Fluttertoast.showToast(
          msg: "没有查找到相似词，请重新输入",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    for (int i = 0; i < results.length; i++) {
      datas.add(forMap(results[i]));
    }
    return datas;
  }

  //{key: smooth, value: 1131, means: [{part: adj., means: [光滑的, 流畅的, 柔软的, 温和的，安详的]}, {part: vt., means: [使平滑, 排除，消除, 安抚，平息, 使优雅]}, {part: vi., means: [变平和，变缓和]}, {part: n., means: [平地，平面]}]}
  static DataBean forMap(result) {
    //print(result);
    //这是Json的数据
    var key = result["key"];
    var value = result["value"];
    var c = "";
    List means = result["means"];
    if (means.length == 0) {
//      Fluttertoast.showToast(
//          msg: "没有查找到相似词，请重新输入",
//          timeInSecForIos: 1,
//          bgcolor: "#e74c3c",
//          textcolor: '#ffffff'
//      );
    }
    for (int i = 0; i < means.length; i++) {
      var mean = means[i];
      // print("-------");
      // print(mean);
      //{part: vi., means: [被弄脏，变脏]}
      List meanO = mean['means'];
//        if(meanO.isEmpty){
//        Fluttertoast.showToast(
//            msg: "没有查找到相似词，请重新输入",
//            timeInSecForIos: 1,
//            bgcolor: "#e74c3c",
//            textcolor: '#ffffff'
//        );
//      }
      // print(meanO);
      for (int i = 0; i < meanO.length; i++) {
        c = c + meanO[i] + " ";
      }
    }
    //var mean = means["means"];
    return new DataBean(c, key);
  }
}
