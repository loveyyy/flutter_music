import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/model/music_entity.dart';

MusicEntity $MusicEntityFromJson(Map<String, dynamic> json) {
	final MusicEntity musicEntity = MusicEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		musicEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		musicEntity.msg = msg;
	}
	final MusicData? data = jsonConvert.convert<MusicData>(json['data']);
	if (data != null) {
		musicEntity.data = data;
	}
	return musicEntity;
}

Map<String, dynamic> $MusicEntityToJson(MusicEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

MusicData $MusicDataFromJson(Map<String, dynamic> json) {
	final MusicData musicData = MusicData();
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		musicData.pageNum = pageNum;
	}
	final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
	if (pageSize != null) {
		musicData.pageSize = pageSize;
	}
	final int? totalPage = jsonConvert.convert<int>(json['totalPage']);
	if (totalPage != null) {
		musicData.totalPage = totalPage;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		musicData.total = total;
	}
	final List<MusicDataList>? list = jsonConvert.convertListNotNull<MusicDataList>(json['list']);
	if (list != null) {
		musicData.list = list;
	}
	return musicData;
}

Map<String, dynamic> $MusicDataToJson(MusicData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['pageNum'] = entity.pageNum;
	data['pageSize'] = entity.pageSize;
	data['totalPage'] = entity.totalPage;
	data['total'] = entity.total;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

MusicDataList $MusicDataListFromJson(Map<String, dynamic> json) {
	final MusicDataList musicDataList = MusicDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		musicDataList.id = id;
	}
	final String? pic = jsonConvert.convert<String>(json['pic']);
	if (pic != null) {
		musicDataList.pic = pic;
	}
	final String? playTime = jsonConvert.convert<String>(json['playTime']);
	if (playTime != null) {
		musicDataList.playTime = playTime;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		musicDataList.url = url;
	}
	final String? lrc = jsonConvert.convert<String>(json['lrc']);
	if (lrc != null) {
		musicDataList.lrc = lrc;
	}
	final String? mname = jsonConvert.convert<String>(json['mname']);
	if (mname != null) {
		musicDataList.mname = mname;
	}
	final String? sname = jsonConvert.convert<String>(json['sname']);
	if (sname != null) {
		musicDataList.sname = sname;
	}
	return musicDataList;
}

Map<String, dynamic> $MusicDataListToJson(MusicDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['pic'] = entity.pic;
	data['playTime'] = entity.playTime;
	data['url'] = entity.url;
	data['lrc'] = entity.lrc;
	data['mname'] = entity.mname;
	data['sname'] = entity.sname;
	return data;
}