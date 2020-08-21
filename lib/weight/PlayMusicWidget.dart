import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/db/PlayMusic.dart';
import 'package:flutter_app/db/DatabaseHelper.dart';
import 'package:flutter_app/http/ApiRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PlayMusicWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlayMusicWidget();
  }
}

class _PlayMusicWidget extends State<PlayMusicWidget> {
  Duration _Allduration;
  double jindu;
  var _img;
  List<PlayMusic> playMusic;
  var _pos;
  List<TextAlign> values = [TextAlign.start, TextAlign.center];

  AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer =  AudioPlayer(playerId: "music");
    _registerEvenBus();
    _loadData();
  }

  void _registerEvenBus() {
    audioPlayer.onPlayerCompletion.listen((event) {
      //播放完成
      print("播放完成");
    });
    audioPlayer.onDurationChanged.listen((Duration duration) {
      _Allduration = duration;
    });

    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      if (mounted) {
        setState(() {
          jindu = duration.inMicroseconds * 100 / _Allduration.inMicroseconds;
          print(jindu);
        });
      }
    });

    audioPlayer.onPlayerError.listen((msg) {
      print("播放异常");
      print(msg);
    });

    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      if (mounted) {
        setState(() {
          switch (state) {
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
      }
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
    audioPlayer.play(playInfo.url);
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
                  if (audioPlayer.state == null) {
                    _getMusic(playMusic[_pos].rid);
                  }
                  if (audioPlayer.state == AudioPlayerState.PLAYING) {
                    audioPlayer.pause();
                  }
                  if (audioPlayer.state == AudioPlayerState.PAUSED) {
                    audioPlayer.resume();
                  }
                },
                child: new Stack(
                  children: [
                    new CircularProgressIndicator(
                      strokeWidth: 3.0,
                      value: jindu,
                      backgroundColor: Colors.blue,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
//                    new Image.asset(
////                      _img == null ? "images/stop.png" : _img,
////                      fit: BoxFit.fill,
////                    )
                  ],
                ),
              )),
          new Text("dddddddddd"),
        ],
      ),
    );
  }
}
