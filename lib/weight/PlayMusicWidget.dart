import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/db/PlayMusic.dart';
import 'package:flutter_app/db/DatabaseHelper.dart';
import 'package:flutter_app/http/ApiRepository.dart';
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
  List<PlayMusic> playMusic;
  var _pos;
  List<TextAlign> values = [TextAlign.start, TextAlign.center];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerEvenBus();
    _loadData();
  }

  void _registerEvenBus() {
    eventBus.on<PlayCompletion>().listen((event) {
      //播放完成
      print("播放完成");
    });

    eventBus.on<PlayAudioPositionChanged>().listen((event) {
        setState(() {
          jindu = event.progree;
          print("进度1:"+jindu.toString());
        });
    });

    eventBus.on<PlayStateChange>().listen((event) {
        setState(() {
          print("状态改变"+event.state.toString());
          switch (event.state) {
            case AudioPlayerState.PLAYING:
              _img = "images/pause.png";
              break;
            case AudioPlayerState.PAUSED:
              _img = "images/play.png";
              break;
            default:
              _img = "images/stop.png";
              break;
          }
        });
    });
  }

  void _loadData() async {
    var playMusic1 = await DatabaseHelper.internal().selectPlayMusic();
    var pref = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        playMusic = playMusic1;
        _pos = pref.getInt("pos");
      });
    }
  }

  void _getMusic(String rid) async {
    var playInfo = await ApiRepository.playMusic(
        rid, new DateTime.now().millisecondsSinceEpoch.toString());
    PlayerController.getInstance().play(playInfo.url);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 60.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          border: new Border.all(color: Colors.black, width: 1.0)),
      child: Row(
        children: <Widget>[
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Image.network(playMusic != null ? playMusic[_pos].pic : ""),
          ),
          Column(
            children: <Widget>[
              Container(
                  height: 25,
                  child: Chip(
                    label: new Text(
                      playMusic != null ? playMusic[_pos].musicName : "请选择歌曲",
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.white,
                  )),
              Container(
                  height: 25,
                  child: Chip(
                      label: new Text(
                        playMusic != null ? playMusic[_pos].singer : "请选择歌曲",
                        textAlign: TextAlign.start,
                      ),
                      backgroundColor: Colors.white))
            ],
          ),
          Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(left: 130.0),
              child: GestureDetector(
                onTap: () {
                  if (PlayerController.getInstance().audioPlayer.state == null) {
                    _getMusic(playMusic[_pos].rid);
                  }
                  if (PlayerController.getInstance().audioPlayer.state == AudioPlayerState.PLAYING) {
                    PlayerController.getInstance().pause();
                  }
                  if (PlayerController.getInstance().audioPlayer.state == AudioPlayerState.PAUSED) {
                    PlayerController.getInstance().audioPlayer.resume();
                  }
                },
                child: new Stack(
                  children: [
                    new CircularProgressIndicator(
                      strokeWidth: 2.0,
                      value: jindu,
                      backgroundColor: Colors.blue,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
//                    new Image.asset(
//                      _img == null ? "images/stop.png" : _img,
//                      height: 25,
//                      width: 25,
//                      fit: BoxFit.fitHeight,
//                    )
                  ],
                ),
              )),
          new Text("dddddddddd"),
        ],
      ),
    );
  }
}
