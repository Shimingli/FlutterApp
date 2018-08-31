import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//在 Flutter 中构建自定义的 Widget 通常采用的是组合其他 Widget 的方式而非传统的继承。
class CustomButton extends StatelessWidget {
  final String label;
  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: () {}, child: new Text(label));
  }
}