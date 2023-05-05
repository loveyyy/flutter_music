import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/music_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class MusicEntity {
	int? code;
	String? msg;
	MusicData? data;

	MusicEntity();

	factory MusicEntity.fromJson(Map<String, dynamic> json) => $MusicEntityFromJson(json);

	Map<String, dynamic> toJson() => $MusicEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MusicData {
	int? pageNum;
	int? pageSize;
	int? totalPage;
	int? total;
	List<MusicDataList>? list;

	MusicData();

	factory MusicData.fromJson(Map<String, dynamic> json) => $MusicDataFromJson(json);

	Map<String, dynamic> toJson() => $MusicDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MusicDataList {
	int? id;
	String? pic;
	String? playTime;
	String? url;
	String? lrc;
	String? mname;
	String? sname;
	int? sid;

	MusicDataList();

	factory MusicDataList.fromJson(Map<String, dynamic> json) => $MusicDataListFromJson(json);

	Map<String, dynamic> toJson() => $MusicDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}