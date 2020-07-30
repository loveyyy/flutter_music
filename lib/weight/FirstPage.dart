import 'package:flutter/material.dart';
import 'package:flutter_app/http/ApiRepository.dart';
import 'package:flutter_app/model/BangList.dart';
import 'package:flutter_app/model/BannerBean.dart';
import 'package:flutter_app/model/PlayList.dart';
import 'package:flutter_app/model/SingerList.dart';
import 'package:flutter_app/weight/MyLoadingWidget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstPage();
  }
}

class _FirstPage extends State {
  BannerBean _list;
  BangList _bangList;
  SingerList _singerList;
  PlayList _playList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

   _loadData() async {
    //如果需要展示进度条，就必须try/catch捕获请求异常。
      var list = await ApiRepository.bannerList();
      var bangList = await ApiRepository.bangList();
      var singerList = await ApiRepository.singerList("1", "10");
      var playList = await ApiRepository.playList("1236933931");
      setState(() {
        _list = list;
        _bangList = bangList;
        _singerList = singerList;
        _playList = playList;
      });
  }

  @override
  Widget build(BuildContext context) {
    if (_list==null||_bangList==null||_singerList.data==null||_playList.data==null){
      return new MyLoadingWidget(
        isShow: true,
        text: "正在加载",
      );
    }
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.only(top: 10, bottom: 30),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Swiper(
              itemBuilder: (context, index) {
                return new Image.network(_list.data[index].pic);
              },
              itemCount: _list.data.length,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 15.0),
            child: new Text(
              "排行榜",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: 600.0,
            child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _bangList.data.length,
              shrinkWrap: true,
              itemExtent: 160.0,
              itemBuilder: (context, index) {
                return new Container(
                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      border:
                          new Border.all(color: Colors.black54, width: 0.5)),
                  child: new Column(
                    children: <Widget>[
                      Container(
                        child: new Image.network(
                          _bangList.data[index].pic,
                          width: 150.0,
                          height: 150.0,
                        ),
                      ),
                      Container(
                        child: new ListView.builder(
                            itemCount: 6,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index1) {
                              return Container(
                                  margin:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 20,
                                        child: new Text(
                                          (index1 + 1).toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        child: new Column(
                                          children: <Widget>[
                                            new Chip(
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              label: new Text(
                                                _bangList.data[index]
                                                    .musicList[index1].name,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                textWidthBasis: TextWidthBasis.parent,
                                              ),
                                              backgroundColor:  Colors.white,
                                              labelStyle: new TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                            new Chip(
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              label: new Text(
                                                _bangList.data[index]
                                                    .musicList[index1].artist,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                              ),
                                              backgroundColor:  Colors.white,
                                              labelStyle: new TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ));
                            }),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 15.0, top: 15.0),
            child: new Text(
              "歌手推荐",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: 120.0,
            margin: EdgeInsets.only(top: 15),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 100.0,
                itemCount: _singerList.data.artistList.length,
                itemBuilder: (context, index2) {
                  return Container(
                    child: new Column(
                      children: <Widget>[
                        Container(
                          child: new Image.network(
                            _singerList.data.artistList[index2].pic,
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Container(
                          child: new Text(
                              _singerList.data.artistList[index2].name),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 15.0, top: 5.0),
            child: new Text(
              "歌单推荐",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: 120.0,
            margin: EdgeInsets.only(top: 15),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 120.0,
                itemCount: _singerList.data.artistList.length,
                itemBuilder: (context, index2) {
                  return Container(
                    child: new Column(
                      children: <Widget>[
                        Container(
                          child: new Image.network(
                            _playList.data.list[index2].img,
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: new Text(
                            _playList.data.list[index2].name,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
