import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/model/music_single_entity.dart';

MusicSingleEntity $MusicSingleEntityFromJson(Map<String, dynamic> json) {
	final MusicSingleEntity musicSingleEntity = MusicSingleEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		musicSingleEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		musicSingleEntity.msg = msg;
	}
	final List<MusicSingleData>? data = jsonConvert.convertListNotNull<MusicSingleData>(json['data']);
	if (data != null) {
		musicSingleEntity.data = data;
	}
	return musicSingleEntity;
}

Map<String, dynamic> $MusicSingleEntityToJson(MusicSingleEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

MusicSingleData $MusicSingleDataFromJson(Map<String, dynamic> json) {
	final MusicSingleData musicSingleData = MusicSingleData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		musicSingleData.id = id;
	}
	final String? pic = jsonConvert.convert<String>(json['pic']);
	if (pic != null) {
		musicSingleData.pic = pic;
	}
	final String? playTime = jsonConvert.convert<String>(json['playTime']);
	if (playTime != null) {
		musicSingleData.playTime = playTime;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		musicSingleData.url = url;
	}
	final String? lrc = jsonConvert.convert<String>(json['lrc']);
	if (lrc != null) {
		musicSingleData.lrc = lrc;
	}
	final int? sid = jsonConvert.convert<int>(json['sid']);
	if (sid != null) {
		musicSingleData.sid = sid;
	}
	final String? mname = jsonConvert.convert<String>(json['mname']);
	if (mname != null) {
		musicSingleData.mname = mname;
	}
	final String? sname = jsonConvert.convert<String>(json['sname']);
	if (sname != null) {
		musicSingleData.sname = sname;
	}
	return musicSingleData;
}

Map<String, dynamic> $MusicSingleDataToJson(MusicSingleData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['pic'] = entity.pic;
	data['playTime'] = entity.playTime;
	data['url'] = entity.url;
	data['lrc'] = entity.lrc;
	data['sid'] = entity.sid;
	data['mname'] = entity.mname;
	data['sname'] = entity.sname;
	return data;
}