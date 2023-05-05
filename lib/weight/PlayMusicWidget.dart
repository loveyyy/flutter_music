import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/music_entity.dart';
import 'package:flutter_app/weight/PlayMusicPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../PlayerController.dart';

class PlayMusicWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlayMusicWidget();
  }
}

class _PlayMusicWidget extends State<PlayMusicWidget> {
  var jindu;
  var _img;
  List<MusicDataList> playMusic = [];
  var _pos = 0;
  List<TextAlign> values = [TextAlign.start, TextAlign.center];
  bool alreadyDispose = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerEvenBus();
    _loadData();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    alreadyDispose = true;
    super.deactivate();
  }

  void _registerEvenBus() {
    eventBus.on<PlayChange>().listen((event) {
      _loadData();
      print("PlayChange");
    });

    eventBus.on<PlayCompletion>().listen((event) {
      //播放完成
      print("播放完成");
    });

    eventBus.on<PlayAudioPositionChanged>().listen((event) {
      if (!alreadyDispose) {
        var j= event.jindu;
        var allJindu = event.allJindu;
        setState(() {
          jindu = j / allJindu;
          //print("进度1:"+jindu.toString());
        });
      }
    });

    eventBus.on<PlayStateChange>().listen((event) {
      if (!alreadyDispose) {
        setState(() {
          print("状态改变" + event.state.toString());
          switch (event.state) {
            case PlayerState.playing:
              _img = "images/pause.png";
              break;
            case PlayerState.paused:
              _img = "images/play.png";
              break;
            default:
              _img = "images/pause.png";
              break;
          }
        });
      }
    });

    eventBus.on<PlayListChange>().listen((event) {
      if (!alreadyDispose) {
        setState(() {
          playMusic = event.musicData;
          _pos = event.pos;
        });
      }
    });
  }

  void _loadData() async {
    var pref = await SharedPreferences.getInstance();
    if (mounted) {
      print(pref.getInt("pos"));
      var a = json.decode(pref.getString("music")!) as List;
      List<MusicDataList> _playMusic = [];
      a.forEach((element) {
        _playMusic.add(MusicDataList.fromJson(element));
      });
      setState(() {
        playMusic = _playMusic;
        _pos = pref.getInt("pos")!;
      });
    }
  }

  ImageProvider<Object> _buildImg() {
    if (playMusic.length > 0) {
      return NetworkImage(
          "http://www.offerkiller.cn/music/" + playMusic[_pos].pic!,
          scale: 2);
    }
    return ExactAssetImage("images/user.png");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlayMusicPage(),
        ));
      },
      child: new Container(
        height: 85.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            border: new Border.all(color: Colors.grey, width: 1.0)),
        child: Column(
          children: [
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 10, right: 10, top: 6),
              child: Row(
                children: <Widget>[
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: _buildImg(), fit: BoxFit.contain),
                          shape: BoxShape.circle)),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: new Text(
                            playMusic.length > 0
                                ? playMusic[_pos].mname!
                                : "请选择歌曲",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          )),
                          Container(
                              child: new Text(
                            playMusic.length > 0
                                ? playMusic[_pos].sname!
                                : "请选择歌曲",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                      child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          PlayerController.getInstance()!.playLast();
                        },
                        child: new Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          child: new Image.asset(
                            "images/last.png",
                            height: 40,
                            width: 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (PlayerController.getInstance()!
                                  .audioPlayer!
                                  .state ==
                              null) {
                            PlayerController.getInstance()!.play(
                                "http://www.offerkiller.cn/music/" +
                                    playMusic[_pos].url!);
                          }
                          if (PlayerController.getInstance()!
                                  .audioPlayer!
                                  .state ==
                              PlayerState.playing) {
                            PlayerController.getInstance()!.pause();
                          }
                          if (PlayerController.getInstance()!
                                  .audioPlayer!
                                  .state ==
                              PlayerState.paused) {
                            PlayerController.getInstance()!
                                .audioPlayer!
                                .resume();
                          }
                        },
                        child: new Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          child: new Image.asset(
                            _img == null ? "images/pause.png" : _img,
                            height: 40,
                            width: 40,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          PlayerController.getInstance()!.playNext();
                        },
                        child: new Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          child: new Image.asset(
                            "images/next.png",
                            height: 40,
                            width: 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(4),
              child: new LinearProgressIndicator(
                  minHeight: 2,
                  value: jindu,
                  backgroundColor: Colors.blue,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
            )
          ],
        ),
      ),
    );
  }
}
