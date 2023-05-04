import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/music_single_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class MusicSingleEntity {
	int? code;
	String? msg;
	List<MusicSingleData>? data;

	MusicSingleEntity();

	factory MusicSingleEntity.fromJson(Map<String, dynamic> json) => $MusicSingleEntityFromJson(json);

	Map<String, dynamic> toJson() => $MusicSingleEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MusicSingleData {
	int? id;
	String? pic;
	String? playTime;
	String? url;
	String? lrc;
	int? sid;
	String? mname;
	String? sname;

	MusicSingleData();

	factory MusicSingleData.fromJson(Map<String, dynamic> json) => $MusicSingleDataFromJson(json);

	Map<String, dynamic> toJson() => $MusicSingleDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}