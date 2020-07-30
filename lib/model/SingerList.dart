import 'package:json_annotation/json_annotation.dart';

part 'SingerList.g.dart';


@JsonSerializable()
class SingerList extends Object {

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

  SingerList(this.code,this.curTime,this.data,this.msg,this.profileId,this.reqId,);

  factory SingerList.fromJson(Map<String, dynamic> srcJson) => _$SingerListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SingerListToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'total')
  String total;

  @JsonKey(name: 'artistList')
  List<ArtistList> artistList;

  Data(this.total,this.artistList,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class ArtistList extends Object {

  @JsonKey(name: 'artistFans')
  int artistFans;

  @JsonKey(name: 'albumNum')
  int albumNum;

  @JsonKey(name: 'mvNum')
  int mvNum;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'musicNum')
  int musicNum;

  @JsonKey(name: 'pic120')
  String pic120;

  @JsonKey(name: 'isStar')
  int isStar;

  @JsonKey(name: 'content_type')
  String contentType;

  @JsonKey(name: 'aartist')
  String aartist;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'pic70')
  String pic70;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'pic300')
  String pic300;

  ArtistList(this.artistFans,this.albumNum,this.mvNum,this.pic,this.musicNum,this.pic120,this.isStar,this.contentType,this.aartist,this.name,this.pic70,this.id,this.pic300,);

  factory ArtistList.fromJson(Map<String, dynamic> srcJson) => _$ArtistListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArtistListToJson(this);

}


