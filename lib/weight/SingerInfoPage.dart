import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/PlayerController.dart';
import 'package:flutter_app/http/ApiRepository.dart';
import 'package:flutter_app/model/music_entity.dart';
import 'package:flutter_app/model/singer_entity.dart';
import 'package:flutter_app/weight/MyLoadingWidget.dart';

import '../model/music_single_entity.dart';
import 'CommonRichText.dart';
import 'PlayMusicWidget.dart';

class SingerInfoPage extends StatefulWidget {
  @required
  SingerDataList singerDataList;

  SingerInfoPage({Key? key, required this.singerDataList}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SingerInfoPage(singerDataList);
  }
}

class _SingerInfoPage extends State<SingerInfoPage> {
  SingerDataList? singerDataList;
  MusicSingleEntity? musicSingleEntity;
  var map = new Map();

  _SingerInfoPage(SingerDataList singerDataList) {
    this.singerDataList = singerDataList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
    map.putIfAbsent("referer", () => "https://zz123.com");
    map.putIfAbsent("authority", () => "mp3.haoge500.com");
    map.putIfAbsent("method", () => "GET");
    map.putIfAbsent("scheme", () => "https");
  }

  void _loadData() async {
    var list = await ApiRepository.getMusicBySinger(singerDataList!.id!);
    setState(() {
      musicSingleEntity = list;
    });
  }

  _setData(int index) async {
    PlayerController.getInstance()!
        .playList(json.encode(musicSingleEntity!.data!), index);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (musicSingleEntity == null) {
      return MyLoadingWidget(
        isShow: true,
        text: "正在加载",
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("歌手详情"),
        ),
        body:
        Column(children: [
          new Container(
              height: 120,
              width: 120,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new NetworkImage(singerDataList!.spic!,
                          headers: map.cast()),
                      fit: BoxFit.contain),
                  shape: BoxShape.circle)),
          new SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  height: 500,
                  child: Column(
                    children: [
                      new Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 10),
                        child: new CommonRichText(
                          text:singerDataList!.sinfo!,
                          // style: TextStyle(
                          //   fontSize: 14,
                          // ),
                        ),
                      ),
                      Expanded(
                        child: new GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: musicSingleEntity!.data!.length,
                          shrinkWrap: true,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
                            childAspectRatio: 0.95,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  //播放列表音乐
                                  this._setData(index);
                                },
                                child: Column(
                                  children: [
                                    new Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: new NetworkImage(
                                                    "http://www.offerkiller.cn/music/" +
                                                        musicSingleEntity!
                                                            .data![index].pic!),
                                                fit: BoxFit.contain),
                                            shape: BoxShape.circle)),
                                    new Text(
                                      musicSingleEntity!.data![index].mname!,
                                      maxLines: 1,
                                    ),
                                  ],
                                ));
                          },
                        ),
                      )
                    ],
                  )))
        ]),
        bottomSheet: new PlayMusicWidget(),
      );
    }
  }
}
