

import 'package:flutter_app/model/BangList.dart';
import 'package:flutter_app/model/BangMusic.dart';
import 'package:flutter_app/model/BannerBean.dart';
import 'package:flutter_app/http/HttpManager.dart';
import 'package:flutter_app/model/PlayInfo.dart';
import 'package:flutter_app/model/PlayList.dart';
import 'package:flutter_app/model/SingerList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiRepository {
  static Future all() async {
    await HttpManager.getNUll("/", {});
  }

  static Future<BannerBean> bannerList() async {
    var pref = await SharedPreferences.getInstance();
    var data = await HttpManager.get("/api/www/banner/index/bannerList", {"reqId": pref.getString("reqId")});
    return BannerBean.fromJson(data);
  }

  static Future<BangList> bangList() async {
    var pref = await SharedPreferences.getInstance();
    var data = await HttpManager.get("/api/www/bang/index/bangList", {"reqId": pref.getString("reqId")});
    return BangList.fromJson(data);
  }

  static Future<SingerList> singerList(String pn,String rn) async {
    var pref = await SharedPreferences.getInstance();
    var data = await HttpManager.get("/api/www/artist/artistInfo", {"category": "11","pn":pn,"rn":rn,"reqId": pref.getString("reqId")});
    return SingerList.fromJson(data);
  }

  static Future<PlayList> playList(String loginUid) async {
    var pref = await SharedPreferences.getInstance();
    var data = await HttpManager.get("/api/www/rcm/index/playlist", {"loginUid": loginUid,"reqId": pref.getString("reqId")});
    return PlayList.fromJson(data);
  }

  static Future<BangMusic> bangMusic(String bangId ,String pn,String rn) async {
    var pref = await SharedPreferences.getInstance();
    var data = await HttpManager.get("/api/www/bang/bang/musicList", {"bangId": bangId,"pn":pn,"rn":rn,"reqId": pref.getString("reqId")});
    return BangMusic.fromJson(data);
  }

  static Future<PlayInfo> playMusic(String rid,String t) async {
    var pref = await SharedPreferences.getInstance();
    var data = await HttpManager.get("/url", {"format": "mp3","rid":rid,"response":"url","type": "convert_url3","br":"128kmp3","from":"web","t":t,"reqId":pref.getString("reqId")});
    return PlayInfo.fromJson(data);
  }



}