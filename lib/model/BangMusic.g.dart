// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BangMusic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BangMusic _$BangMusicFromJson(Map<String, dynamic> json) {
  return BangMusic(
      json['code'] as int,
      json['curTime'] as int,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['msg'] as String,
      json['profileId'] as String,
      json['reqId'] as String);
}

Map<String, dynamic> _$BangMusicToJson(BangMusic instance) => <String, dynamic>{
      'code': instance.code,
      'curTime': instance.curTime,
      'data': instance.data,
      'msg': instance.msg,
      'profileId': instance.profileId,
      'reqId': instance.reqId
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['img'] as String,
      json['num'] as String,
      json['pub'] as String,
      (json['musicList'] as List)
          ?.map((e) =>
              e == null ? null : MusicList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'img': instance.img,
      'num': instance.num,
      'pub': instance.pub,
      'musicList': instance.musicList
    };

MusicList _$MusicListFromJson(Map<String, dynamic> json) {
  return MusicList(
      json['musicrid'] as String,
      json['artist'] as String,
      json['mvpayinfo'] == null
          ? null
          : Mvpayinfo.fromJson(json['mvpayinfo'] as Map<String, dynamic>),
      json['trend'] as String,
      json['pic'] as String,
      json['isstar'] as int,
      json['rid'] as int,
      json['duration'] as int,
      json['score100'] as String,
      json['content_type'] as String,
      json['rank_change'] as String,
      json['track'] as int,
      json['hasLossless'] as bool,
      json['hasmv'] as int,
      json['releaseDate'] as String,
      json['album'] as String,
      json['albumid'] as int,
      json['pay'] as String,
      json['artistid'] as int,
      json['albumpic'] as String,
      json['songTimeMinutes'] as String,
      json['isListenFee'] as bool,
      json['pic120'] as String,
      json['name'] as String,
      json['online'] as int,
      json['payInfo'] == null
          ? null
          : PayInfo.fromJson(json['payInfo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MusicListToJson(MusicList instance) => <String, dynamic>{
      'musicrid': instance.musicrid,
      'artist': instance.artist,
      'mvpayinfo': instance.mvpayinfo,
      'trend': instance.trend,
      'pic': instance.pic,
      'isstar': instance.isstar,
      'rid': instance.rid,
      'duration': instance.duration,
      'score100': instance.score100,
      'content_type': instance.contentType,
      'rank_change': instance.rankChange,
      'track': instance.track,
      'hasLossless': instance.hasLossless,
      'hasmv': instance.hasmv,
      'releaseDate': instance.releaseDate,
      'album': instance.album,
      'albumid': instance.albumid,
      'pay': instance.pay,
      'artistid': instance.artistid,
      'albumpic': instance.albumpic,
      'songTimeMinutes': instance.songTimeMinutes,
      'isListenFee': instance.isListenFee,
      'pic120': instance.pic120,
      'name': instance.name,
      'online': instance.online,
      'payInfo': instance.payInfo
    };

Mvpayinfo _$MvpayinfoFromJson(Map<String, dynamic> json) {
  return Mvpayinfo(
      json['play'] as int, json['vid'] as int, json['down'] as int);
}

Map<String, dynamic> _$MvpayinfoToJson(Mvpayinfo instance) => <String, dynamic>{
      'play': instance.play,
      'vid': instance.vid,
      'down': instance.down
    };

PayInfo _$PayInfoFromJson(Map<String, dynamic> json) {
  return PayInfo(
      json['play'] as String,
      json['download'] as String,
      json['cannotDownload'] as int,
      json['cannotOnlinePlay'] as int,
      json['feeType'] == null
          ? null
          : FeeType.fromJson(json['feeType'] as Map<String, dynamic>),
      json['down'] as String);
}

Map<String, dynamic> _$PayInfoToJson(PayInfo instance) => <String, dynamic>{
      'play': instance.play,
      'download': instance.download,
      'cannotDownload': instance.cannotDownload,
      'cannotOnlinePlay': instance.cannotOnlinePlay,
      'feeType': instance.feeType,
      'down': instance.down
    };

FeeType _$FeeTypeFromJson(Map<String, dynamic> json) {
  return FeeType(json['song'] as String, json['vip'] as String);
}

Map<String, dynamic> _$FeeTypeToJson(FeeType instance) =>
    <String, dynamic>{'song': instance.song, 'vip': instance.vip};
