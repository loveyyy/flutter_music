import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/db/PlayMusic.dart';
import 'package:flutter_app/http/ApiRepository.dart';
import 'package:flutter_app/model/BangMusic.dart';
import 'package:flutter_app/weight/MyLoadingWidget.dart';
import 'package:flutter_app/db/DatabaseHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/PlayerController.dart';

import '../main.dart';

// ignore: must_be_immutable
class RankHomePage extends StatefulWidget {
  Map<String, String> map;

  RankHomePage(this.map, {Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RankHomePage();
  }
}

class _RankHomePage extends State<RankHomePage> {
  BangMusic _bangMusic;
  SharedPreferences _pref;
  AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer=new AudioPlayer(playerId: "music");
    _loadData();
  }

  void _loadData() async {
    var bangMusic =
        await ApiRepository.bangMusic(widget.map["bangid"], "1", "30");
    var pref = await SharedPreferences.getInstance();
    setState(() {
      _bangMusic = bangMusic;
      _pref=pref;
    });
  }

  void _getMusic(String rid) async {
    var playInfo =
    await ApiRepository.playMusic(rid,new DateTime.now().millisecondsSinceEpoch.toString());
    int result = await audioPlayer.play(playInfo.url);
    if(result==1){
      print("播放成功");
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_bangMusic == null) {
      return MyLoadingWidget(
        isShow: true,
        text: "正在加载",
      );
    }else{
      return  Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(builder: (context)=>new MyHomePage(index: 1)),
                    (route)=>route==null
            ),
          ),
          title: Text(widget.map["title"]),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: new Column(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  child: new Image.network(_bangMusic.data.img !=null ?_bangMusic.data.img:"http://gzpic.ctmus.cn/res.dcms.v1/billboard/5/75953/d-d7b3/5759533d-d7b3-488a-b2e8-247646c90a16.jpg",),
                ),
                Container(
                  child: new ListView.builder(
                    itemCount: _bangMusic.data.musicList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index1) {
                      return GestureDetector(
                        onTap: (){
                          //替换待播放音乐
                          DatabaseHelper.internal().deleteAllPlayMusic();
                          _bangMusic.data.musicList.forEach((music)=>
                              DatabaseHelper.internal().insertPlayMusic(new PlayMusic(music.musicrid, music.artist, music.name, music.duration,
                                  music.album, music.albumpic, music.pic, music.rid.toString()))
                          );
                          //音乐播放
                          _pref.setInt("pos", 0);
                          _getMusic(_bangMusic.data.musicList[0].rid.toString());
                        },
                        child: new Container(
                          margin: EdgeInsets.only(left: 0.5,right: 0.5,top: 0.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: new Border.all(
                                  color: Colors.black54, width: 0.5)),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  margin: EdgeInsets.all(10.0),
                                  child: new Image.network(
                                      _bangMusic.data.musicList[index1].pic),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                  child: new Text(
                                    _bangMusic.data.musicList[index1].name,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                  child: new Text(
                                    _bangMusic.data.musicList[index1].artist,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                  child: new Text(
                                    _bangMusic.data.musicList[index1].album,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  onPressed: () {
                                    //音乐下载
                                  },
                                  child: new Image.asset("images/download.png"),
                                  color: Colors.white,
                                  elevation: 0,
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

  }
}
