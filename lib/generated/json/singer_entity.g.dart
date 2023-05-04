import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/model/singer_entity.dart';

SingerEntity $SingerEntityFromJson(Map<String, dynamic> json) {
	final SingerEntity singerEntity = SingerEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		singerEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		singerEntity.msg = msg;
	}
	final SingerData? data = jsonConvert.convert<SingerData>(json['data']);
	if (data != null) {
		singerEntity.data = data;
	}
	return singerEntity;
}

Map<String, dynamic> $SingerEntityToJson(SingerEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

SingerData $SingerDataFromJson(Map<String, dynamic> json) {
	final SingerData singerData = SingerData();
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		singerData.pageNum = pageNum;
	}
	final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
	if (pageSize != null) {
		singerData.pageSize = pageSize;
	}
	final int? totalPage = jsonConvert.convert<int>(json['totalPage']);
	if (totalPage != null) {
		singerData.totalPage = totalPage;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		singerData.total = total;
	}
	final List<SingerDataList>? list = jsonConvert.convertListNotNull<SingerDataList>(json['list']);
	if (list != null) {
		singerData.list = list;
	}
	return singerData;
}

Map<String, dynamic> $SingerDataToJson(SingerData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['pageNum'] = entity.pageNum;
	data['pageSize'] = entity.pageSize;
	data['totalPage'] = entity.totalPage;
	data['total'] = entity.total;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

SingerDataList $SingerDataListFromJson(Map<String, dynamic> json) {
	final SingerDataList singerDataList = SingerDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		singerDataList.id = id;
	}
	final String? sinfo = jsonConvert.convert<String>(json['sinfo']);
	if (sinfo != null) {
		singerDataList.sinfo = sinfo;
	}
	final String? spic = jsonConvert.convert<String>(json['spic']);
	if (spic != null) {
		singerDataList.spic = spic;
	}
	final String? sname = jsonConvert.convert<String>(json['sname']);
	if (sname != null) {
		singerDataList.sname = sname;
	}
	return singerDataList;
}

Map<String, dynamic> $SingerDataListToJson(SingerDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['sinfo'] = entity.sinfo;
	data['spic'] = entity.spic;
	data['sname'] = entity.sname;
	return data;
}