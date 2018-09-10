import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OfficialNetWorkPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new OfficialNetWorkPageState();
  }

}
class OfficialNetWorkPageState extends State<OfficialNetWorkPage>{
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("官方NetWorkDemo",style: new TextStyle(color: Colors.purpleAccent),),
        ),
        body: new ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[i]["title"]}",style: new TextStyle(color: Colors.orange,fontSize: 18.00),)
    );
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = JSON.decode(response.body);
    });
  }

}