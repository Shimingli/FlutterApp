import 'package:flutter/material.dart';
import 'package:flutter_app/home/question.dart';
import 'package:fluttertoast/fluttertoast.dart';


class TabThree extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new TabThreeState();
  }
}
class TabThreeState extends State<TabThree>{
  Widget hotCard(Question question) {
    return new Container(
      //color: Colors.orange,
      decoration: new BoxDecoration(
          color:Colors.white12,
          border: new BorderDirectional(
              bottom: new BorderSide(color:  Colors.white12 , width: 1.0)
          )
      ),
      child: new FlatButton(
          onPressed: (){
            Fluttertoast.showToast(
                msg: "点不动我哈哈！",
                timeInSecForIos: 1,
                bgcolor: "#e74c3c",
                textcolor: '#ffffff');
          },
          child: new Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              flex: 1,
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Text(
                        question.order,
                        style: new TextStyle(
                            color: question.order.compareTo("03") <= 0 ? Colors.red : Colors.yellow,
                            fontSize: 18.0
                        )
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  question.rise != null ?
                  new Row(
                    children: <Widget>[
                      new Icon(Icons.arrow_upward, color: Colors.red, size: 10.0,),
                      new Text(question.rise, style: new TextStyle(color: Colors.red, fontSize: 10.0),)
                    ],
                  ) : new Container()
                ],
              )
          ),
      new Expanded(
              flex: 6,
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Text(
                      question.title,
                      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 1.1, color:  Colors.brown ),
                    ),
                    padding: const EdgeInsets.only(bottom: 10.0,right: 4.0),
                    alignment: Alignment.topLeft,
                  ),
                  question.mark != null ?
                  new Container(
                      child: new Text(question.mark, style: new TextStyle(color:Colors.white12)),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 8.0,right: 4.0)
                  ) : new Container(),
                  new Container(
                    child: new Text(question.hotNum, style: new TextStyle(color: Colors.white12)),
                    alignment: Alignment.topLeft,
                  )
                ],
              )
          ),
          new Expanded(
              flex: 3,
              child: new AspectRatio(
                  aspectRatio: 3.0 / 2.0,
                  child: new Container(
                    foregroundDecoration:new BoxDecoration(
                        image: new DecorationImage(
                          //todo 我喜欢
                          image: new NetworkImage(question.imgUrl),
                          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),
                        borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                    ),
                  )
              )
          ),





        ],
      ),
    )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new Column(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
              ),
              hotCard(questionList[0]),
              hotCard(questionList[1]),
              hotCard(questionList[2]),
              hotCard(questionList[3]),
              hotCard(questionList[4]),
            ],
          ),
        )
    );
  }

}