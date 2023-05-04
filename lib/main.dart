import 'package:flutter/material.dart';
import 'package:flutter_app/weight/FirstPage.dart';
import 'package:flutter_app/weight/PlayMusicWidget.dart';
import 'package:flutter_app/weight/SearchPage.dart';
import 'package:flutter_app/weight/SingerInfoPage.dart';
import 'package:flutter_app/weight/SingerPage.dart';

import 'weight/TopWeight.dart';

void main() => runApp(MyApp());

final routes ={
  "/":(context) => MyHomePage(),
  "/SingerInfo":(context,{singerDataList}) => SingerInfoPage(singerDataList: singerDataList),
  "/SearchPage":(context) => SearchPage(),
};


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
      ThemeData(primaryColor: Colors.white),
      home: MyHomePage(),
      onGenerateRoute: (RouteSettings settings) {
        String? routeName = settings.name;
        Function pageController =  routes[routeName] as Function;
        if (pageController != null) {
          if(settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) => pageController(context,arguments:settings.arguments)
            );
            return route;
          }else{
            final Route route = MaterialPageRoute(
                builder: (context) => pageController(context)
            );
            return route;
          }
        }
        return  MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
              body: Center(
                child: Text("Page not found"),
              ));
        });;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final index;

  MyHomePage({Key? key, this.index = 0}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(this.index);
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  var _currentIndex = 0;
  List<Tab> list1 = [];
  var tabTitle = ['推荐','歌手'];

  _MyHomePageState(index) {
    this._currentIndex = index;
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化
     _tabController = new TabController(vsync: this, length: tabTitle.length);
    //添加监听，记录当前切换到的页面索引
    _tabController?.addListener(() {
      setState(() => _currentIndex = _tabController!.index);
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
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
                      fontSize: _tabController!.index == 0 ? 14 : 15,
                      fontWeight: _tabController!.index == 0
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
                    fontSize: _tabController!.index == 1 ? 14 : 15,
                    fontWeight: _tabController!.index == 1
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
        bottom: _getTabBar(_currentIndex) as PreferredSizeWidget,
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(child: new FirstPage()),
          Container(child: new SingerPage()),
        ],
      ),
        bottomSheet: new PlayMusicWidget(),
    );
  }
}
