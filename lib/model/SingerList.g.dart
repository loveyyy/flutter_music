// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SingerList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingerList _$SingerListFromJson(Map<String, dynamic> json) {
  return SingerList(
      json['code'] as int,
      json['curTime'] as int,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['msg'] as String,
      json['profileId'] as String,
      json['reqId'] as String);
}

Map<String, dynamic> _$SingerListToJson(SingerList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'curTime': instance.curTime,
      'data': instance.data,
      'msg': instance.msg,
      'profileId': instance.profileId,
      'reqId': instance.reqId
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['total'] as String,
      (json['artistList'] as List)
          ?.map((e) =>
              e == null ? null : ArtistList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'total': instance.total,
      'artistList': instance.artistList
    };

ArtistList _$ArtistListFromJson(Map<String, dynamic> json) {
  return ArtistList(
      json['artistFans'] as int,
      json['albumNum'] as int,
      json['mvNum'] as int,
      json['pic'] as String,
      json['musicNum'] as int,
      json['pic120'] as String,
      json['isStar'] as int,
      json['content_type'] as String,
      json['aartist'] as String,
      json['name'] as String,
      json['pic70'] as String,
      json['id'] as int,
      json['pic300'] as String);
}

Map<String, dynamic> _$ArtistListToJson(ArtistList instance) =>
    <String, dynamic>{
      'artistFans': instance.artistFans,
      'albumNum': instance.albumNum,
      'mvNum': instance.mvNum,
      'pic': instance.pic,
      'musicNum': instance.musicNum,
      'pic120': instance.pic120,
      'isStar': instance.isStar,
      'content_type': instance.contentType,
      'aartist': instance.aartist,
      'name': instance.name,
      'pic70': instance.pic70,
      'id': instance.id,
      'pic300': instance.pic300
    };
