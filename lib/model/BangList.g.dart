// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BangList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BangList _$BangListFromJson(Map<String, dynamic> json) {
  return BangList(
      json['code'] as int,
      json['curTime'] as int,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['msg'] as String,
      json['profileId'] as String,
      json['reqId'] as String);
}

Map<String, dynamic> _$BangListToJson(BangList instance) => <String, dynamic>{
      'code': instance.code,
      'curTime': instance.curTime,
      'data': instance.data,
      'msg': instance.msg,
      'profileId': instance.profileId,
      'reqId': instance.reqId
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['leader'] as String,
      json['num'] as String,
      json['name'] as String,
      json['pic'] as String,
      json['id'] as String,
      json['pub'] as String,
      (json['musicList'] as List)
          ?.map((e) =>
              e == null ? null : MusicList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'leader': instance.leader,
      'num': instance.num,
      'name': instance.name,
      'pic': instance.pic,
      'id': instance.id,
      'pub': instance.pub,
      'musicList': instance.musicList
    };

MusicList _$MusicListFromJson(Map<String, dynamic> json) {
  return MusicList(
      json['musicrid'] as String,
      json['hasmv'] as int,
      json['artist'] as String,
      json['releaseDate'] as String,
      json['mvpayinfo'] == null
          ? null
          : Mvpayinfo.fromJson(json['mvpayinfo'] as Map<String, dynamic>),
      json['album'] as String,
      json['albumid'] as int,
      json['pay'] as String,
      json['artistid'] as int,
      json['albumpic'] as String,
      json['pic'] as String,
      json['isstar'] as int,
      json['rid'] as int,
      json['isListenFee'] as bool,
      json['duration'] as int,
      json['score100'] as String,
      json['pic120'] as String,
      json['content_type'] as String,
      json['name'] as String,
      json['online'] as int,
      json['track'] as int,
      json['payInfo'] == null
          ? null
          : PayInfo.fromJson(json['payInfo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MusicListToJson(MusicList instance) => <String, dynamic>{
      'musicrid': instance.musicrid,
      'hasmv': instance.hasmv,
      'artist': instance.artist,
      'releaseDate': instance.releaseDate,
      'mvpayinfo': instance.mvpayinfo,
      'album': instance.album,
      'albumid': instance.albumid,
      'pay': instance.pay,
      'artistid': instance.artistid,
      'albumpic': instance.albumpic,
      'pic': instance.pic,
      'isstar': instance.isstar,
      'rid': instance.rid,
      'isListenFee': instance.isListenFee,
      'duration': instance.duration,
      'score100': instance.score100,
      'pic120': instance.pic120,
      'content_type': instance.contentType,
      'name': instance.name,
      'online': instance.online,
      'track': instance.track,
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
