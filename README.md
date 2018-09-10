* 首先推荐两篇文章，写的非常的详细，从中可以了解到原理，写的非常的详细！
  * [美团技术团队Flutter见解](https://mp.weixin.qq.com/s/cJjKZCqc8UuzvEtxK1BJCw)
  * [下一代移动端跨平台框架-Flutter大解密](https://mp.weixin.qq.com/s/ZMp2fSOTlYkZ_aNIOrUZdw)
* Demo 的下载地址（正式包，使用Flutter命令打的正式包）
![蒲公英.png](https://upload-images.jianshu.io/upload_images/5363507-8f053f1f4bdbdaa3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* App详情

![ezgif-2-c954a6dd5e.gif](https://upload-images.jianshu.io/upload_images/5363507-a3a6b8c67f6c91a7.gif?imageMogr2/auto-orient/strip)
![ezgif-2-f3661cf95e.gif](https://upload-images.jianshu.io/upload_images/5363507-a5aa441b40672140.gif?imageMogr2/auto-orient/strip)



###　App的页面详情
####  `HomePage`;里面嵌套了四个页面，使用的是` TabBar`和 `TabBarView`的组合，比如安卓中的`Fragment` `Viewpager`
   *   1、首页的第一页使用豆瓣电影的接口，请求数据，并且展示出来了，工程中如何代码中如何使用依赖？如下代码所示
 ```
    flutter:
    sdk: flutter
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.0
  fluttertoast: ^2.0.7 #"Packages get" 要去主动的 get 一次依赖
   dio: ^v1.0.3
  # 添加网络依赖
  ```
* 2、演示了图片控件摆放
* 3、综合列表的展示
* 4、其他控件的使用Demo

 ![首页.jpg](https://upload-images.jianshu.io/upload_images/5363507-a5ac11b98426ed74.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![一些控件.jpg](https://upload-images.jianshu.io/upload_images/5363507-83593aae936c8b0d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

     * 首页的关键代码
    ```
     //为给定的[子]控件创建默认选项卡控制器。
    return new DefaultTabController(
        length: 5,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.black45,
           // title: titleWidget(),
            title: new Text("首页",style: new TextStyle(color: Colors.white,fontSize: 22.00),),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.add_a_photo), onPressed: () {
                Navigator
                    .of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new OtherPage();
                }));
              })
            ],
            bottom: new TabBar(
                isScrollable: true,
                labelStyle: new TextStyle(fontSize: 22.00,color: Colors.red),
                indicatorPadding:EdgeInsets.zero,
                labelColor: Colors.white,
                indicatorWeight:4.0,
                unselectedLabelColor: Colors.blueAccent,
                tabs: [
                  new Tab(
                    text: "豆瓣电影",
                  ),
                  new Tab(
                    text: "控件摆放",
                  ),
                  new Tab(
                    text: "列表展示",
                  ),
                  new Tab(
                    text: "其他控件展示",
                  ),
                ]),
          ),
          body: new TabBarView(children: [new TabOne(), new TabTwo(),new TabThree(),new TabFroth()]),
        ));
    ```
#### SimilarWordsPage寻找近义词Demo，就是一个点击按钮，然后请求网络，刷新页面的流程。
* 1、使用了`TextField`相当于安卓中的`Edittext`,只不过获取值的时候有些变化
   ```
      new Expanded(
            child: new TextField(
              //不要主动弹起来
              autofocus: false,
              controller: _textController,
              decoration: new InputDecoration.collapsed(
                  hintText: "请输入要查找的词",
                  hintStyle: new TextStyle(color: Colors.red)),
            ),
   ```
* 2、如何退出页面` Navigator.of(context).pop();`
* 3、如何使用`Toast`，这里我是使用了三方的依赖!底层原理是使用了反射，具体实现的方法，有兴趣的同学可以看看` String res = await _channel.invokeMethod('showToast', params);`
  ```
     Fluttertoast.showToast(
                      msg: "输入为空，请重新输入",
                      timeInSecForIos: 1,
                      bgcolor: "#e74c3c",
                      textcolor: '#ffffff');
  ```
  * 4、带框的Button的使用，具体请看实现的代码。
  *  5、具体页面如下

![近义词页面.jpg](https://upload-images.jianshu.io/upload_images/5363507-a8bf490c02429f68.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 *  6、代码如下 
  ```
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
  static int i=0;
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
          i=position;
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
                      child: new Text('条目 = '+i.toString(),style: new TextStyle(color: Theme.of(context).primaryColor),),
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
  ```

####  官方Demo

![官方Demo.jpg](https://upload-images.jianshu.io/upload_images/5363507-861c721e72f18243.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 关于我 

![关于我.jpg](https://upload-images.jianshu.io/upload_images/5363507-a9422980c719b94d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


####  一些总结
*  `widget `相当于` View`，`Widget`的实例仅仅存在每一帧之间，并且每一帧之间 `Flutter`都会主动的创建一颗`Widget`树用于下一帧的渲染。
*  `Android` 中 `View` 是可变的，在 `Flutter` 中的 `Widget` 是不可变的。这种特性使得 `Flutter` 中的 `Widget` 变得十分轻量级
*  一个 `Widget `会变化，那么它就是有状态的。但是如果一个子` Widget `是有状态的，但是其父` Widget `是不可变的话父` Widget `也可以是 `StatelessWidget `。
* `TatelessWidget `和`StatefulWidget` 的核心内容是一致的，它们都会在每一帧中被重构，不同之处在于` StatefulWidget` 有一个 `State` 对象，它可以为 `StatefulWidget` 在不同帧之间存储数据。
*  `Flutter` 中` UI `的布局是通过在` dart` 文件中构建 `Widget` 树来实现的。
* 在 `Android `中，使用 `LinearLayout` 使你的部件垂直或水平放置。在 `Flutter `中，你可以使用` Row` 或者 `Co​​lumn` 来实现相同的效果。
* 在 `Flutter` 中，最简单的方法是使用` ListView` 。在` Flutter` 中，`ListView` 既是` ScrollView` 又是`Android`中的` ListView`。
* 通过使用` Column`，`Row` 和` Stack`等 `Widget` 的组合来实现 `RelativeLayout` 的效果
*   `Flutter` 中，添加触摸监听器有两种方法
  * 如果` Widget `支持事件检测，则可以将一个函数传递给它并进行处理。例如，`RaisedButton` 有一个` onPressed` 参数
  * 如果 `Widget `不支持事件检测，则可以将该 `Widget` 包装到 `GestureDetector `中，并将函数传递给`onTap` 参数。
*  `GestureDetector` 我们可以监听广泛的手势
*  要充分利用应用程序中的 `Material `风格的组件的话，可以把顶级部件 `MaterialApp `作为应用程序的入口。`MaterialApp `作为一个比较方便的部件，包装了许多实现了 `Material` 风格所需要的部件（如 `Scaffold `）。`MaterialApp `是在 `WidgetsApp` 的基础上进行实现的
*  `Flutter `不会自动导入包
*  `Column `相当于 相对布局`  Row `线性布局 
*  首页的数据结构展示 
*  `HttpClient`导入的包是  `io`里面的  
*  `DEBUG` 包要不正式包大很多 `Built build\app\outputs\apk\debug\app-debug.apk (31.9MB).`而正式包才`8.4M`.
*  解决的`Bug`的时候太痛苦了，`Flutter `使用 `ide` ，太痛苦了
*  在脑袋要构思出 这个布局的整体的结构 
*  关闭系统自带的防火墙，重启OK  由于需要出差，就是用的是笔记本开发，导致自己笔记本的防火墙没有被关闭，真的是日了狗了,[解决防火墙](https://www.cnblogs.com/dreamyu/p/8032588.html)。
*   MediaQuery.of(context).size.width /  4分之一的屏幕
*   ` MaterialApp` 带有 `Debug`的标记 

#### 感谢以下资料给与我的帮助
   * [Android 开发者参考](http://doc.flutter-dev.cn/flutter-for-android/)
   * Api的接口 [查询近义词](https://github.com/jokermonn/-Api/blob/master/KingsoftDic.md)
   * Api的接口 [豆瓣电影](https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=100&client=somemessage&udid=dddddddddddddddddddddd)
   * [打包的流程](https://www.jianshu.com/p/f91b4e84cec8)
  

  #  求赞或者求星星 **[FlutterApp](https://github.com/Shimingli/FlutterApp)** 

## Getting Started
* For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
