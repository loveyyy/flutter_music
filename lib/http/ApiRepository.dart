import 'dart:convert';

import 'package:flutter_app/http/HttpManager.dart';
import 'package:flutter_app/model/music_entity.dart';
import 'package:flutter_app/model/music_single_entity.dart';
import 'package:flutter_app/model/singer_entity.dart';

class ApiRepository {
  static Future<MusicEntity> bannerList(int pageNum) async {
    Map<String, int> map = new Map();
    map.putIfAbsent("pageNum", () => pageNum);
    map.putIfAbsent("pageSize", () => 20);
    var data = await HttpManager.postJson(
        "/api/music/get", jsonEncode(map).toString());
    return MusicEntity.fromJson(data);
  }

  static Future<SingerEntity> singerList(int pageNum) async {
    Map<String, int> map = new Map();
    map.putIfAbsent("pageNum", () => pageNum);
    map.putIfAbsent("pageSize", () => 20);
    var data = await HttpManager.postJson(
        "/api/singer/get", jsonEncode(map).toString());
    return SingerEntity.fromJson(data);
  }

  static Future<MusicEntity> searchMusic(int pageNum, String name) async {
    Map<String, Object> map = new Map();
    map.putIfAbsent("pageNum", () => pageNum);
    map.putIfAbsent("pageSize", () => 20);
    map.putIfAbsent("name", () => name);
    var data = await HttpManager.postJson(
        "/api/music/search", jsonEncode(map).toString());
    return MusicEntity.fromJson(data);
  }

  static Future<MusicSingleEntity> getMusicBySinger(int singerId) async {
    var data = await HttpManager.get(
        "/api/singer/getMusic", {"id": singerId.toString()});
    return MusicSingleEntity.fromJson(data);
  }
//
// static Future<BangMusic> bangMusic(String bangId ,String pn,String rn) async {
//   var pref = await SharedPreferences.getInstance();
//   var data = await HttpManager.get("/api/www/bang/bang/musicList", {"bangId": bangId,"pn":pn,"rn":rn,"reqId": pref.getString("reqId")});
//   return BangMusic.fromJson(data);
// }
//
// static Future<PlayInfo> playMusic(String rid,String t) async {
//   var pref = await SharedPreferences.getInstance();
//   var data = await HttpManager.get("/url", {"format": "mp3","rid":rid,"response":"url","type": "convert_url3","br":"128kmp3","from":"web","t":t,"reqId":pref.getString("reqId")});
//   return PlayInfo.fromJson(data);
// }
}
