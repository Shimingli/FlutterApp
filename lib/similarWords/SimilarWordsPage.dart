import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/DataBean.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SimilarWordsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SimilarWordsPageState();
  }
}

class SimilarWordsPageState extends State<SimilarWordsPage> {
  List<DataBean> datas = [];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: findAppBar(),
      backgroundColor: Colors.black12,
      body: findBody(),
    );
  }

  findBody() {
    return new Container(
        child: new Scaffold(
      body: new ListView.builder(
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    ));
  }

  Widget findAppBar() {
    return new AppBar(
        title: new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new FlatButton.icon(
              onPressed: () {
                // 本来就在栈顶，退出会有显示的问题
                Navigator.of(context).pop();
              },
              icon: new Icon(Icons.close, color: Colors.white30),
              label: new Text(""),
            ),
            width: 60.0,
          ),
          new Expanded(
            child: new TextField(
              //不要主动弹起来
              autofocus: false,
              controller: _textController,
              decoration: new InputDecoration.collapsed(
                  hintText: "请输入要查找的词",
                  hintStyle: new TextStyle(color: Colors.red)),
            ),
          ),
          //点击事件的第一种实现的方式  我觉得不太好
          //  new GestureDetector(child: new Icon(Icons.find_in_page),onTap: (){print("dd");})
          // 这种点击时间有点效果
          new IconButton(
              icon: new Icon(Icons.find_in_page),
              onPressed: () {
                print(_textController.text);
                if (_textController.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "输入为空，请重新输入",
                      timeInSecForIos: 1,
                      bgcolor: "#e74c3c",
                      textcolor: '#ffffff');
                } else {
                  FocusNode focusNode = new FocusNode();
                  FocusScope.of(context).requestFocus(new FocusNode());
                  Fluttertoast.showToast(
                      msg: "查找值为：" + _textController.text,
                      timeInSecForIos: 1,
                      bgcolor: "#e74c3c",
                      textcolor: '#ffffff');
                  getApiData(_textController.text);
                  focusNode.unfocus();
                }
              })
        ],
      ),
      decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: Colors.white10),
    ));
  }

  Widget getRow(int i) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      // child: new Text("Row ${datas[i].key}",style: new TextStyle(color: Colors.orange,fontSize: 18.00),)
      //  Column 相当于 相对布局  Row 线性布局
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new OutlineButton(
                      borderSide:new BorderSide(color: Theme.of(context).primaryColor),
                      child: new Text(' ',style: new TextStyle(color: Theme.of(context).primaryColor),),
                      onPressed: (){},
                    )
                ),
              ],
            ),
          ),

          new Container(
            child: new Text(
              "联想到的词：" + datas[i].key,
              style: new TextStyle(color: Colors.purple, fontSize: 12.00),
            ),
            padding: new EdgeInsets.all(10.0),
          ),
          new Container(
            child: new Text("联想到词的翻译信息：" + datas[i].message,
                style: new TextStyle(color: Colors.cyan, fontSize: 15.00)),
            padding: new EdgeInsets.all(10.0),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // 网络请求
    //http://dict-mobile.iciba.com/interface/index.php?c=word&m=getsuggest&nums=10&client=6&is_need_mean=1&word=sm
    //我的 Api的地址
    getApiData("sm");
  }

  // 网络请求
  void getApiData(String tag) async {
    // 注意导入的包的地方是  import 'dart:io';
    var httpClient = new HttpClient();
    var url =
        "http://dict-mobile.iciba.com/interface/index.php?c=word&m=getsuggest&nums=20&client=6&is_need_mean=1&word=" +
            tag;
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var jsonData = await response.transform(utf8.decoder).join();
      setState(() {
        datas = DataBean.decodeData(jsonData);
      });
      for (int i = 0; i < datas.length; i++) {
        print(datas[i].key);
        print(datas[i].message);
      }
    }
  }
}
