import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/http/ApiRepository.dart';
import 'package:flutter_app/weight/MyLoadingWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../PlayerController.dart';
import '../model/music_entity.dart';

class PlayMusicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlayMusicState();
  }
}

class PlayMusicState extends State<PlayMusicPage> {
  String _img = "images/play.png";
  List<MusicDataList> playMusic = [];
  List<String> lrcList = [];
  List<int> timeList = [];
  var _pos = 0;
  int currentIndex = 0;
  bool alreadyDispose = false;
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alreadyDispose = false;
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
        if (currentIndex < timeList.length - 1) {
          if (event.jindu >= timeList[currentIndex + 1]) {
            if (currentIndex + 1 > 10) {
              scrollController.jumpTo((currentIndex + 1) * 30 - 200);
            }
            setState(() {
              currentIndex = currentIndex + 1;
            });
          }
        }
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
              _img = "images/play.png";
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
      _pos = pref.getInt("pos")!;
      var lrc = await ApiRepository.lrc(_playMusic[_pos].lrc!);
      formatLrc(lrc);
      setState(() {
        playMusic = _playMusic;
        _pos = _pos;
      });
    }
  }

  void formatLrc(String l) {
    Map<int, String> map = new Map();
    var lrcs = l.split("\n");
    print(lrcs);
    lrcs.forEach((lrc) {
      if (lrc != "") {
        int size = lrc.split("]").length;
        String time = "";
        if (size == 2) {
          //[00:00] 无歌词格式
          if (lrc.split("]")[0].contains(":") &&
              lrc.split("]")[0].contains(".")) {
            time = lrc.split("]")[0].replaceAll("[", "");
            lrc = lrc.split("]")[1];
          } else {
            lrc = lrc.split("]")[0].replaceAll("[", "");
          }
          setValue(time, lrc, map);
        } else if (size == 3) {
          time = lrc.split("]")[0].replaceAll("[", "");
          setValue(time, lrc.split("]")[2], map);

          var time1 = lrc.split("]")[1].replaceAll("[", "");
          setValue(time1, lrc.split("]")[2], map);
        } else {
          time = lrc.split("]")[0].replaceAll("[", "");
          setValue(time, lrc.split("]")[3], map);
        }
      }
    });
    timeList = map.keys.toList();
    timeList.sort();
    print(timeList);
    timeList.forEach((element) {
      lrcList.add(map[element].toString());
    });
    print(lrcList);
  }

  void setValue(String time, String lrc, Map<int, String> map) {
    double longtime = 0;
    if (time.toString().contains(":")) {
      var timetList = time.split(":");
      if (timetList[0] != "00") {
        if (timetList[0].startsWith("0")) {
          longtime = longtime +
              double.parse(timetList[0].replaceFirst("0", "")) * 60 * 1000;
        } else {
          longtime = longtime + double.parse(timetList[0]) * 10 * 60 * 1000;
        }
      }
      if (timetList[1].startsWith("0")) {
        longtime =
            longtime + double.parse(timetList[1].replaceFirst("0", "")) * 1000;
      } else {
        longtime = longtime + double.parse(timetList[1]) * 1000;
      }
    }
    longtime = longtime * 1000;

    map[longtime.floor()] = lrc;
  }

  @override
  Widget build(BuildContext context) {
    if (playMusic.length == 0) {
      return MyLoadingWidget(isShow: true, text: "请稍等。。。");
    }
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.indigo.shade300,
      appBar: AppBar(
        title: Text("播放音乐")
      ),
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 30,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          playMusic[_pos].mname!,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.indigo.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(playMusic[_pos].sname!,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.indigo.shade600,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )),
              Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("http://www.offerkiller.cn/music/" +
                            playMusic[_pos].pic!),
                        fit: BoxFit.fill,
                        opacity: 0.7),
                    shape: BoxShape.circle),
                child: ListView.builder(
                    itemCount: lrcList.length,
                    scrollDirection: Axis.vertical,
                    controller: scrollController,
                    itemExtent: 30,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(lrcList[index],
                            style: TextStyle(
                                color: currentIndex == index
                                    ? Colors.red
                                    : Colors.indigo,
                                fontSize: currentIndex == index ? 20 : 18,
                                fontWeight: currentIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.w500)),
                      );
                    }),
              ),
              Positioned(
                bottom: 100,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        PlayerController.getInstance().playLast();
                      },
                      child: new Container(
                        margin: EdgeInsets.only(left: 30),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        child: new Image.asset(
                          "images/last.png",
                          height: 60,
                          width: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (PlayerController.getInstance()
                                .audioPlayer!
                                .state ==
                            PlayerState.playing) {
                          PlayerController.getInstance().pause();
                        }else if (PlayerController.getInstance()
                                .state ==
                            PlayerState.paused) {
                          PlayerController.getInstance().audioPlayer!.resume();
                        }else{
                          PlayerController.getInstance().play(
                              "http://www.offerkiller.cn/music/" +
                                  playMusic[_pos].url!);
                        }
                      },
                      child: new Container(
                        margin: EdgeInsets.only(left: 30),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        child: new Image.asset(
                          _img,
                          height: 60,
                          width: 60,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        PlayerController.getInstance().playNext();
                      },
                      child: new Container(
                        margin: EdgeInsets.only(left: 30),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        child: new Image.asset(
                          "images/next.png",
                          height: 60,
                          width: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
