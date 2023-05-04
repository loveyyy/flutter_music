import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/singer_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SingerEntity {
	int? code;
	String? msg;
	SingerData? data;

	SingerEntity();

	factory SingerEntity.fromJson(Map<String, dynamic> json) => $SingerEntityFromJson(json);

	Map<String, dynamic> toJson() => $SingerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SingerData {
	int? pageNum;
	int? pageSize;
	int? totalPage;
	int? total;
	List<SingerDataList>? list;

	SingerData();

	factory SingerData.fromJson(Map<String, dynamic> json) => $SingerDataFromJson(json);

	Map<String, dynamic> toJson() => $SingerDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SingerDataList {
	int? id;
	String? sinfo;
	String? spic;
	String? sname;

	SingerDataList();

	factory SingerDataList.fromJson(Map<String, dynamic> json) => $SingerDataListFromJson(json);

	Map<String, dynamic> toJson() => $SingerDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}