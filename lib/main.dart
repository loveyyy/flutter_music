import 'package:flutter/material.dart';
import 'package:flutter_app/weight/FirstPage.dart';

import 'http/ApiRepository.dart';
import 'weight/TopWeight.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.white, backgroundColor: Colors.white),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var _currentIndex = 0;
  List<Tab> list1 = new List();
  var tabTitle = ['推荐', '排行榜', '歌手', '歌单', '视频'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化
    _tabController = new TabController(vsync: this, length: tabTitle.length);
    //添加监听，记录当前切换到的页面索引
    _tabController.addListener(() {
      setState(() => _currentIndex = _tabController.index);
    });
    _loadDataMain();
  }

  void _loadDataMain() async {
    //如果需要展示进度条，就必须try/catch捕获请求异常。
    await ApiRepository.all();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    for (int i = 0; i < tabTitle.length; i++) {
      list1.add(new Tab(text: tabTitle[i]));
    }
    Widget _getTabBar(int index) {
      var tabBar = new TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  tabTitle[0],
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: _tabController.index == 0 ? 14 : 15,
                      fontWeight: _tabController.index == 0
                          ? FontWeight.w600
                          : FontWeight.normal),
                ),
                padding: EdgeInsets.only(bottom: 10.0),
              )
            ],
          ),
          Column(children: <Widget>[
            Container(
              child: Text(
                tabTitle[1],
                textAlign: TextAlign.justify,
                style: new TextStyle(
                    fontSize: _tabController.index == 1 ? 14 : 15,
                    fontWeight: _tabController.index == 1
                        ? FontWeight.w600
                        : FontWeight.normal),
              ),
              padding: EdgeInsets.only(bottom: 10.0),
            )
          ]),
          Column(children: <Widget>[
            Container(
              child: Text(
                tabTitle[2],
                textAlign: TextAlign.justify,
                style: new TextStyle(
                    fontSize: _tabController.index == 2 ? 14 : 15,
                    fontWeight: _tabController.index == 2
                        ? FontWeight.w600
                        : FontWeight.normal),
              ),
              padding: EdgeInsets.only(bottom: 10.0),
            )
          ]),
          Column(children: <Widget>[
            Container(
              child: Text(
                tabTitle[3],
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: _tabController.index == 3 ? 14 : 15,
                    fontWeight: _tabController.index == 3
                        ? FontWeight.w600
                        : FontWeight.normal),
              ),
              padding: EdgeInsets.only(bottom: 10.0),
            )
          ]),
          Column(children: <Widget>[
            Container(
              child: Text(
                tabTitle[4],
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: _tabController.index == 4 ? 14 : 15,
                    fontWeight: _tabController.index == 4
                        ? FontWeight.w600
                        : FontWeight.normal),
              ),
              padding: EdgeInsets.only(bottom: 10.0),
            )
          ]),
        ],
        labelColor: Colors.black,
        isScrollable: false,
        unselectedLabelColor: Colors.black,
      );
      return tabBar;
    }

    return Scaffold(
      appBar: AppBar(
        title: new TopWeight(),
        bottom: _getTabBar(_currentIndex),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(child: new FirstPage()),
          Center(child: Text(tabTitle[1])),
          Center(child: Text(tabTitle[2])),
          Center(child: Text(tabTitle[3])),
          Center(child: Text(tabTitle[3]))
        ],
      ),
    );
  }
}
