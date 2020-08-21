
import 'package:json_annotation/json_annotation.dart';

part 'PlayInfo.g.dart';

@JsonSerializable()
class PlayInfo extends Object{
    int code;
    String msg;
    String url;

    PlayInfo({this.code, this.msg, this.url});

    factory PlayInfo.fromJson(Map<String, dynamic> json) => _$PlayInfoFromJson(json);
    Map<String, dynamic> toJson() => _$PlayInfoToJson(this);
}