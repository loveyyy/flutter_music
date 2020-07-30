import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    var pref = await SharedPreferences.getInstance();
    options.headers.addAll({"Cookie":pref.getStringList("cookie"),"csrf":pref.get("token")});
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    // TODO: implement onResponse
    var pref = await SharedPreferences.getInstance();
    var cookie = response.headers.map["set-cookie"].isNotEmpty
        ? response.headers.map["set-cookie"]
        : null;
    var token = response.headers.map["set-cookie"].isNotEmpty
        ? response.headers.map["set-cookie"].toString().split(";")[0].split("=")[1]
        : null;
    pref.setStringList("cookie", cookie);
    pref.setString("token", token);
    return super.onResponse(response);
  }

}