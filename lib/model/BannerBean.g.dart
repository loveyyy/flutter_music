// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BannerBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerBean _$BannerBeanFromJson(Map<String, dynamic> json) {
  return BannerBean(
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

Map<String, dynamic> _$BannerBeanToJson(BannerBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'curTime': instance.curTime,
      'data': instance.data,
      'msg': instance.msg,
      'profileId': instance.profileId,
      'reqId': instance.reqId
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['id'] as int, json['pic'] as String, json['priority'] as int,
      json['url'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'pic': instance.pic,
      'priority': instance.priority,
      'url': instance.url
    };
