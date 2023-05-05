import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:event_bus/event_bus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/music_entity.dart';

class PlayerController {
  AudioPlayer? audioPlayer;
  static PlayerController? _instance;
  int _Allduration = 0;
  List<MusicDataList> playMusic = [];
  var _pos = 0;

  static PlayerController? getInstance() {
    if (_instance == null) {
      _instance = PlayerController();
    }
    return _instance;
  }

  PlayerController() {
    if (audioPlayer != null) {
      audioPlayer!.dispose();
    }
    audioPlayer = AudioPlayer(playerId: "music");

    audioPlayer!.onPlayerComplete.listen((event) {
      //播放完成
      print("播放完成");
      eventBus.fire(PlayCompletion());
    });

    audioPlayer!.onDurationChanged.listen((Duration duration) {
      _Allduration = duration.inMicroseconds;
    });

    audioPlayer!.onPositionChanged.listen((Duration duration) {
      eventBus.fire(PlayAudioPositionChanged(duration.inMicroseconds,_Allduration));
      print("进度:" + duration.inMicroseconds.toString());
    });

    // audioPlayer.onPlayerError.listen((msg) {
    //   eventBus.fire(PlayError(msg));
    // });

    audioPlayer!.onPlayerStateChanged.listen((PlayerState state) {
      print("状态改变:" + state.name);
      eventBus.fire(PlayStateChange(state));
    });
  }

  Future<void> playList(String music, int pos) async {
    var pref = await SharedPreferences.getInstance();
    pref.setInt("pos", pos);
    pref.setString("music", music);
    var a = json.decode(music) as List;
    this.playMusic.clear();
    a.forEach((element) {
      this.playMusic.add(MusicDataList.fromJson(element));
    });
    this._pos = pos;
    eventBus.fire(PlayListChange(this._pos, this.playMusic));
    await audioPlayer!.play(
        UrlSource("http://www.offerkiller.cn/music/" + playMusic![_pos].url!));
  }

  Future<void> play(String url) async {
    await audioPlayer!.resume();
    await audioPlayer!.play(UrlSource(url));
  }

  playNext() async {
    if (this._pos == this.playMusic.length) {
      this._pos = 0;
    } else {
      this._pos++;
    }
    var pref = await SharedPreferences.getInstance();
    pref.setInt("pos", this._pos);
    eventBus.fire(PlayListChange(this._pos, this.playMusic));
    await audioPlayer!.resume();
    await audioPlayer!.play(
        UrlSource("http://www.offerkiller.cn/music/" + playMusic[_pos].url!));
  }

  playLast() async {
    if (this._pos == 0) {
      this._pos = this.playMusic!.length - 1;
    } else {
      this._pos--;
    }
    var pref = await SharedPreferences.getInstance();
    pref.setInt("pos", this._pos);
    eventBus.fire(PlayListChange(this._pos, this.playMusic!));
    await audioPlayer!.resume();
    await audioPlayer!.play(
        UrlSource("http://www.offerkiller.cn/music/" + playMusic![_pos].url!));
  }

  release() async {
    print("释放哦哦");
    await audioPlayer!.release();
    await audioPlayer!.dispose();
    audioPlayer = null;
    _instance = null;
  }

  pause() async {
    await audioPlayer!.pause();
    print("pause成功");
  }

  stop() async {
    await audioPlayer!.stop();
    print("stop成功");
  }

  seekTo(int time) async {
    await audioPlayer!.seek(Duration(milliseconds: time));
    print("seekTo成功");
  }

  resume() async {
    await audioPlayer!.resume();
    print("resume成功");
  }
}

EventBus eventBus = new EventBus();

class PlayCompletion {
  PlayCompletion();
}

class PlayStateChange {
  PlayerState state;

  PlayStateChange(this.state);
}

class PlayChange {
  PlayChange();
}

class PlayListChange {
  int pos;
  List<MusicDataList> musicData;

  PlayListChange(this.pos, this.musicData);
}

class PlayError {
  String msg;

  PlayError(this.msg);
}

class PlayAudioPositionChanged {
  var jindu;
  var allJindu;

  PlayAudioPositionChanged(this.jindu,this.allJindu);
}
