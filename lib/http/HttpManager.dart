/*
 * 网络管理
 */
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class HttpManager {
  static HttpManager? _instance;

  static HttpManager getInstance() {
    if (_instance == null) {
      _instance = HttpManager();
    }
    return _instance!;
  }

  Dio dio = Dio();

  HttpManager() {
    dio.options.baseUrl = "http://www.offerkiller.cn/";
    dio.options.connectTimeout = Duration(seconds: 10000);
    dio.options.receiveTimeout = Duration(seconds: 5000);
    dio.interceptors.add(LogInterceptor(
        responseBody: true, responseHeader: true, requestHeader: true));
  }

  static Future<String> getStr(String path, Map<String, dynamic> map) async {
    var response = await getInstance().dio.get(path, queryParameters: map);
    print(response);
    return processResponseStr(response);
  }

  static Future<Map<String, dynamic>> get(
      String path, Map<String, dynamic> map) async {
    var response = await getInstance().dio.get(path, queryParameters: map);
    print(response.data);
    return processResponse(response);
  }

  /*
    表单形式
   */
  static Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> map) async {
    var response = await getInstance().dio.post(path,
        data: map,
        options: Options(
            contentType: "application/x-www-form-urlencoded",
            headers: {"Content-Type": "application/x-www-form-urlencoded"}));
    return processResponse(response);
  }

  static Future<Map<String, dynamic>> postJson(String path, String json) async {
    var response = await getInstance().dio.post(path,
        data: json,
        options: Options(
            contentType: "application/json",
            headers: {"Content-Type": "application/json"}));
    return processResponse(response);
  }

  static Future<Map<String, dynamic>> processResponse(Response response) async {
    if (response.statusCode == 200) {
      Map<String, dynamic> map;
      var data = response.data;
      if (data.runtimeType == String) {
        map = json.decode(data);
        data = map;
      }
      int code = data["code"];
      String msg = data["msg"];
      if (code == 200) {
        //请求响应成功
        return data;
      }
      throw Exception(msg);
    }
    throw Exception("server error");
  }

  static Future<String> processResponseStr(Response response) async {
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception("server error");
  }
}
