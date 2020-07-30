import 'package:json_annotation/json_annotation.dart';

part 'BannerBean.g.dart';


@JsonSerializable()
class BannerBean extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'curTime')
  int curTime;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'profileId')
  String profileId;

  @JsonKey(name: 'reqId')
  String reqId;

  BannerBean(this.code,this.curTime,this.data,this.msg,this.profileId,this.reqId,);

  factory BannerBean.fromJson(Map<String, dynamic> srcJson) => _$BannerBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerBeanToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'priority')
  int priority;

  @JsonKey(name: 'url')
  String url;

  Data(this.id,this.pic,this.priority,this.url,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}



