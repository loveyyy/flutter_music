import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/PlayerController.dart';
import 'package:flutter_app/http/ApiRepository.dart';
import 'package:flutter_app/model/music_entity.dart';
import 'package:flutter_app/weight/MyLoadingWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstPage();
  }
}

class _FirstPage extends State with AutomaticKeepAliveClientMixin {
  MusicEntity? _list;
  PlayerController? playerController;
  var pageNum = 1;
  var pageTotal = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
    playerController = PlayerController.getInstance();
  }

  _loadData() async {
    //如果需要展示进度条，就必须try/catch捕获请求异常。
    if (pageTotal == 0) {
      var list = await ApiRepository.bannerList(pageNum);
      setState(() {
        _list = list;
        pageTotal = _list!.data!.totalPage!;
      });
    } else {
      this._changeData();
    }
  }

  _changeData() async {
    //如果需要展示进度条，就必须try/catch捕获请求异常。
    pageNum = Random().nextInt(this.pageTotal);
    var list = await ApiRepository.bannerList(pageNum);
    setState(() {
      _list = list;
      pageTotal = _list!.data!.totalPage!;
    });
  }

  _setData(int index) async {
    playerController!.playList(json.encode(_list!.data!.list), index);
  }

  // 刷新
  Future<void> _onRefresh() async {
    this._loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_list == null) {
      return new MyLoadingWidget(
        isShow: true,
        text: "正在加载",
      );
    }
    return  ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Container(
        padding: EdgeInsets.only(top: 10,bottom: 60),
         child:Stack(
            children: [
              RefreshIndicator(
                  backgroundColor: Colors.white,
                  displacement: 0,
                  color: Colors.blue,
                  onRefresh: _onRefresh,
                  child: new GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _list!.data!.list!.length,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                      maxCrossAxisExtent: 140,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _setData(index);
                        },
                        child: new Column(
                          children: <Widget>[
                            Container(
                                child: new Column(
                                  children: [
                                    new Image.network(
                                      "http://www.offerkiller.cn/music/" +
                                          _list!.data!.list![index].pic!,
                                      width: 120.0,
                                      height: 120.0,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    new Container(
                                      width: 120,
                                      child: new Text(
                                          _list!.data!.list![index].mname!,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: GoogleFonts.acme(
                                              textStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400))),
                                    ),
                                    new Container(
                                      width: 120,
                                      child: new Text(
                                          _list!.data!.list![index].sname!,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: GoogleFonts.acme(
                                              textStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400))),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      );
                    },
                  )),
              GestureDetector(
                  onTap: () {
                    this._changeData();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: new Container(
                      margin: EdgeInsets.only(top: 20, right: 20),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blueAccent),
                      child: Text(
                        "换一批",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ))
            ],
          )
      ),
    );
  }
}
