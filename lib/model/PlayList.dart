import 'package:json_annotation/json_annotation.dart';

part 'PlayList.g.dart';


@JsonSerializable()
class PlayList extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'curTime')
  int curTime;

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'profileId')
  String profileId;

  @JsonKey(name: 'reqId')
  String reqId;

  PlayList(this.code,this.curTime,this.data,this.msg,this.profileId,this.reqId,);

  factory PlayList.fromJson(Map<String, dynamic> srcJson) => _$PlayListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlayListToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'list')
  List<Play> list;

  Data(this.list,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Play extends Object {

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'uname')
  String uname;

  @JsonKey(name: 'img700')
  String img700;

  @JsonKey(name: 'img300')
  String img300;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'img500')
  String img500;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'listencnt')
  int listencnt;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'tag')
  String tag;


  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'info')
  String info;

  Play(this.img,this.uname,this.img700,this.img300,this.userName,this.img500,this.total,this.name,this.listencnt,this.id,this.tag,this.desc,this.info);

  factory Play.fromJson(Map<String, dynamic> srcJson) => _$PlayFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlayToJson(this);

}


