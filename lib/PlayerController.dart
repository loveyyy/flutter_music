import 'package:audioplayers/audioplayers.dart';
import 'package:event_bus/event_bus.dart';


class PlayerController {
  AudioPlayer audioPlayer;
  static PlayerController _instance;
  var _Allduration;
  double jindu;

  static PlayerController getInstance() {
    if (_instance == null) {
      _instance = PlayerController();
    }
    return _instance;
  }

  PlayerController() {
    audioPlayer = AudioPlayer(playerId: "music");

    audioPlayer.onPlayerCompletion.listen((event) {
      //播放完成
      print("播放完成");
      eventBus.fire(PlayCompletion());
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      _Allduration = duration;
    });

    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      jindu = duration.inMicroseconds / _Allduration.inMicroseconds;
      eventBus.fire(PlayAudioPositionChanged(jindu));
      print("进度:"+jindu.toString());
    });

    audioPlayer.onPlayerError.listen((msg) {
      eventBus.fire(PlayError(msg));
    });

    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      eventBus.fire(PlayStateChange(state));
    });
  }

  play(String url) async {
    audioPlayer.release();
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
      print("play成功");
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      // success
      print("pause成功");
    }
  }

  stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      // success
      print("stop成功");
    }
  }

  seekTo(int time) async {
    int result = await audioPlayer.seek(Duration(milliseconds: time));
    if (result == 1) {
      // success
      print("seekTo成功");
    }
  }

  resume() async {
    int result = await audioPlayer.resume();
    if (result == 1) {
      // success
      print("resume成功");
    }
  }

}

EventBus eventBus = new EventBus();

class PlayCompletion{
  PlayCompletion();
}

class PlayStateChange{
  AudioPlayerState state;
  PlayStateChange(this.state);
}

class PlayError{
  String msg;
  PlayError(this.msg);
}

class PlayAudioPositionChanged{
  var progree;
  PlayAudioPositionChanged(this.progree);
}

