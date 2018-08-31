# flutter_app

## A new Flutter application.
* widget 相当于 View，Widget的实例仅仅存在每一帧之间，并且每一帧之间 Flutter都会主动的创建一颗Widget树用于下一帧的渲染。
* Android 中 View 是可变的，在 Flutter 中的 Widget 是不可变的。这种特性使得 Flutter 中的 Widget 变得十分轻量级
* 一个 Widget 会变化，那么它就是有状态的。但是如果一个子 Widget 是有状态的，但是其父 Widget 是不可变的话父 Widget 也可以是 StatelessWidget 。
* tatelessWidget 和 StatefulWidget 的核心内容是一致的，它们都会在每一帧中被重构，不同之处在于 StatefulWidget 有一个 State 对象，它可以为 StatefulWidget 在不同帧之间存储数据。
* flutter 打包的流程：https://www.jianshu.com/p/f91b4e84cec8



## Getting Started
* For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
