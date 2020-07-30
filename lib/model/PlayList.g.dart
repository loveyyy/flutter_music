// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlayList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayList _$PlayListFromJson(Map<String, dynamic> json) {
  return PlayList(
      json['code'] as int,
      json['curTime'] as int,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['msg'] as String,
      json['profileId'] as String,
      json['reqId'] as String);
}

Map<String, dynamic> _$PlayListToJson(PlayList instance) => <String, dynamic>{
      'code': instance.code,
      'curTime': instance.curTime,
      'data': instance.data,
      'msg': instance.msg,
      'profileId': instance.profileId,
      'reqId': instance.reqId
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data((json['list'] as List)
      ?.map((e) => e == null ? null : Play.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'list': instance.list};

Play _$PlayFromJson(Map<String, dynamic> json) {
  return Play(
      json['img'] as String,
      json['uname'] as String,
      json['img700'] as String,
      json['img300'] as String,
      json['userName'] as String,
      json['img500'] as String,
      json['total'] as int,
      json['name'] as String,
      json['listencnt'] as int,
      json['id'] as int,
      json['tag'] as String,
      json['desc'] as String,
      json['info'] as String);
}

Map<String, dynamic> _$PlayToJson(Play instance) => <String, dynamic>{
      'img': instance.img,
      'uname': instance.uname,
      'img700': instance.img700,
      'img300': instance.img300,
      'userName': instance.userName,
      'img500': instance.img500,
      'total': instance.total,
      'name': instance.name,
      'listencnt': instance.listencnt,
      'id': instance.id,
      'tag': instance.tag,
      'desc': instance.desc,
      'info': instance.info
    };
