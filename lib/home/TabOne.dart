import 'package:flutter/material.dart';
import 'package:flutter_app/widget/CustomButton.dart';


class TabOne extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new TabOneState();
  }
}
class TabOneState extends State<TabOne>{
  @override
  Widget build(BuildContext context) {
    //return new Text("nihao");
    return new Container(child: new CustomButton("nihao"),);
  }

}