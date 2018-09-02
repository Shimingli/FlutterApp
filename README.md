# flutter_app

## A new Flutter application.

* [Android 开发者参考](http://doc.flutter-dev.cn/flutter-for-android/)
* widget 相当于 View，Widget的实例仅仅存在每一帧之间，并且每一帧之间 Flutter都会主动的创建一颗Widget树用于下一帧的渲染。
* Android 中 View 是可变的，在 Flutter 中的 Widget 是不可变的。这种特性使得 Flutter 中的 Widget 变得十分轻量级
* 一个 Widget 会变化，那么它就是有状态的。但是如果一个子 Widget 是有状态的，但是其父 Widget 是不可变的话父 Widget 也可以是 StatelessWidget 。
* tatelessWidget 和 StatefulWidget 的核心内容是一致的，它们都会在每一帧中被重构，不同之处在于 StatefulWidget 有一个 State 对象，它可以为 StatefulWidget 在不同帧之间存储数据。
* flutter 打包的流程：https://www.jianshu.com/p/f91b4e84cec8
*  Flutter 中 UI 的布局是通过在 dart 文件中构建 Widget 树来实现的。
* 在 Android 中，使用 LinearLayout 使你的部件垂直或水平放置。在 Flutter 中，你可以使用 Row 或者 Co​​lumn 来实现相同的效果。
* 在 Flutter 中，最简单的方法是使用 ListView 。在 Flutter 中，ListView 既是 ScrollView 又是 Android 中的 ListView。
* 通过使用 Column，Row 和 Stack 等 Widget 的组合来实现 RelativeLayout 的效果
*   Flutter 中，添加触摸监听器有两种方法
  * 如果 Widget 支持事件检测，则可以将一个函数传递给它并进行处理。例如，RaisedButton 有一个 onPressed 参数
  * 如果 Widget 不支持事件检测，则可以将该 Widget 包装到 GestureDetector 中，并将函数传递给 onTap 参数。

*  GestureDetector 我们可以监听广泛的手势
*  要充分利用应用程序中的 Material 风格的组件的话，可以把顶级部件 MaterialApp 作为应用程序的入口。MaterialApp 作为一个比较方便的部件，包装了许多实现了 Material 风格所需要的部件（如 Scaffold ）。MaterialApp 是在 WidgetsApp 的基础上进行实现的
*  Api的接口 [Api](https://github.com/jokermonn/-Api/blob/master/KingsoftDic.md)

*  Flutter 不会自动导入包
## Getting Started
* For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
