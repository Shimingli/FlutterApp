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
  void initState() {
    // TODO: implement initState
    super.initState();
    //http://dict-mobile.iciba.com/interface/index.php?c=word&m=getsuggest&nums=10&client=6&is_need_mean=1&word=sm
     //我的 Api的地址
  }
  @override
  Widget build(BuildContext context) {
    //return new Text("nihao");
    // api 的接口在这里哦  https://github.com/jokermonn/-Api/blob/master/KingsoftDic.md
    return new Container(child: new CustomButton("nihao"),);
  }

}