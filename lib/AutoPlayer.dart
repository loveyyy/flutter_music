//
//import 'package:audioplayers/audioplayers.dart';
//
//
//class AutoPlayer {
//  AutoPlayer.internal();
//
//
//  play(String url) async {
//    audioPlayer.release();
//    int result = await audioPlayer.play(url);
//    if (result == 1) {
//      // success
//      print("play成功");
//    }
//  }
//
//  pause() async {
//    int result = await audioPlayer.pause();
//    if (result == 1) {
//      // success
//      print("pause成功");
//    }
//  }
//
//
//  stop() async {
//    int result = await audioPlayer.stop();
//    if (result == 1) {
//      // success
//      print("stop成功");
//    }
//  }
//
//  seekTo(int time) async {
//    int result = await audioPlayer.seek(Duration(milliseconds: time));
//    if (result == 1) {
//      // success
//      print("seekTo成功");
//    }
//  }
//
//  resume() async {
//    int result = await audioPlayer.resume();
//    if (result == 1) {
//      // success
//      print("resume成功");
//    }
//  }
//}