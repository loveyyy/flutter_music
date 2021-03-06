import 'package:json_annotation/json_annotation.dart';

part 'BangList.g.dart';

@JsonSerializable()
class BangList extends Object {

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

    BangList(this.code,this.curTime,this.data,this.msg,this.profileId,this.reqId,);

    factory BangList.fromJson(Map<String, dynamic> srcJson) => _$BangListFromJson(srcJson);

    Map<String, dynamic> toJson() => _$BangListToJson(this);

}


@JsonSerializable()
class Data extends Object {

    @JsonKey(name: 'leader')
    String leader;

    @JsonKey(name: 'num')
    String num;

    @JsonKey(name: 'name')
    String name;

    @JsonKey(name: 'pic')
    String pic;

    @JsonKey(name: 'id')
    String id;

    @JsonKey(name: 'pub')
    String pub;

    @JsonKey(name: 'musicList')
    List<MusicList> musicList;

    Data(this.leader,this.num,this.name,this.pic,this.id,this.pub,this.musicList,);

    factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

    Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class MusicList extends Object {

    @JsonKey(name: 'musicrid')
    String musicrid;

    @JsonKey(name: 'hasmv')
    int hasmv;

    @JsonKey(name: 'artist')
    String artist;

    @JsonKey(name: 'releaseDate')
    String releaseDate;

    @JsonKey(name: 'mvpayinfo')
    Mvpayinfo mvpayinfo;

    @JsonKey(name: 'album')
    String album;

    @JsonKey(name: 'albumid')
    int albumid;

    @JsonKey(name: 'pay')
    String pay;

    @JsonKey(name: 'artistid')
    int artistid;

    @JsonKey(name: 'albumpic')
    String albumpic;

    @JsonKey(name: 'pic')
    String pic;

    @JsonKey(name: 'isstar')
    int isstar;

    @JsonKey(name: 'rid')
    int rid;

    @JsonKey(name: 'isListenFee')
    bool isListenFee;

    @JsonKey(name: 'duration')
    int duration;

    @JsonKey(name: 'score100')
    String score100;

    @JsonKey(name: 'pic120')
    String pic120;

    @JsonKey(name: 'content_type')
    String contentType;

    @JsonKey(name: 'name')
    String name;

    @JsonKey(name: 'online')
    int online;

    @JsonKey(name: 'track')
    int track;

    @JsonKey(name: 'payInfo')
    PayInfo payInfo;

    MusicList(this.musicrid,this.hasmv,this.artist,this.releaseDate,this.mvpayinfo,this.album,this.albumid,this.pay,this.artistid,this.albumpic,this.pic,this.isstar,this.rid,this.isListenFee,this.duration,this.score100,this.pic120,this.contentType,this.name,this.online,this.track,this.payInfo,);

    factory MusicList.fromJson(Map<String, dynamic> srcJson) => _$MusicListFromJson(srcJson);

    Map<String, dynamic> toJson() => _$MusicListToJson(this);

}


@JsonSerializable()
class Mvpayinfo extends Object {

    @JsonKey(name: 'play')
    int play;

    @JsonKey(name: 'vid')
    int vid;

    @JsonKey(name: 'down')
    int down;

    Mvpayinfo(this.play,this.vid,this.down,);

    factory Mvpayinfo.fromJson(Map<String, dynamic> srcJson) => _$MvpayinfoFromJson(srcJson);

    Map<String, dynamic> toJson() => _$MvpayinfoToJson(this);

}


@JsonSerializable()
class PayInfo extends Object {

    @JsonKey(name: 'play')
    String play;

    @JsonKey(name: 'download')
    String download;

    @JsonKey(name: 'cannotDownload')
    int cannotDownload;

    @JsonKey(name: 'cannotOnlinePlay')
    int cannotOnlinePlay;

    @JsonKey(name: 'feeType')
    FeeType feeType;

    @JsonKey(name: 'down')
    String down;

    PayInfo(this.play,this.download,this.cannotDownload,this.cannotOnlinePlay,this.feeType,this.down,);

    factory PayInfo.fromJson(Map<String, dynamic> srcJson) => _$PayInfoFromJson(srcJson);

    Map<String, dynamic> toJson() => _$PayInfoToJson(this);

}


@JsonSerializable()
class FeeType extends Object {

    @JsonKey(name: 'song')
    String song;

    @JsonKey(name: 'vip')
    String vip;

    FeeType(this.song,this.vip,);

    factory FeeType.fromJson(Map<String, dynamic> srcJson) => _$FeeTypeFromJson(srcJson);

    Map<String, dynamic> toJson() => _$FeeTypeToJson(this);

}


