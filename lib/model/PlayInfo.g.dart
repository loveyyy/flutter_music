// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlayInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayInfo _$PlayInfoFromJson(Map<String, dynamic> json) {
  return PlayInfo(
      code: json['code'] as int,
      msg: json['msg'] as String,
      url: json['url'] as String);
}

Map<String, dynamic> _$PlayInfoToJson(PlayInfo instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'url': instance.url
    };
