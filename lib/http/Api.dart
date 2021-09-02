import 'dart:convert';
import 'dart:core';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:dichvubonmua/storage/AppPreferences.dart';
import 'package:dichvubonmua/ui/account/login/model/LoginReq.dart';
import 'package:dichvubonmua/ui/account/login/model/LoginRes.dart';

import 'package:dichvubonmua/http/utils/HttpUtils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'GeneralDataApi.dart';
import 'utils/JWTGenerator.dart';


class Api {
  Api._internal();

  static Api? _instance;

  factory Api() {
    _instance = _instance ?? new Api._internal();
    return _instance!;
  }

  final String BASE_URL = "https://landapi.vipage.vn";

  Future<Map<String, String>> get baseHeaders async {
    return {
      "Content-Type": "application/json",
      "OS-NAME": Platform.isAndroid ? "android" : "ios",
      "OS-VERSION": "2.0.1",
      "APP-VERSION": "1.0.0",
      "DEVICE-NAME": await HttpUtils.getDeviceName(),
      "DEVICE-TOKEN": AppPreferences().getDeviceToken(),
      "FCM-TOKEN": "",
      "S-TOKEN": JWTGenerator().genSToken(),
    };
  }



  Map<String, dynamic> middleware(Response res) {
    String cvUtf = utf8.decode(res.bodyBytes);
    var jsonResponse = convert.jsonDecode(cvUtf) as Map<String, dynamic>;
    Map<String, dynamic> result = new Map<String, dynamic>();
    result["status"] = res.statusCode;
    if (res.statusCode == 200) {
      result["data"] = jsonResponse;
      print('Request success:$res');
    } else {
      result["error"] = jsonResponse;
      print('Request failed with status: ${res.statusCode}.');
    }

    return result;
  }

/*
 Login
 */

  Future<GeneralDataApi<LoginRes>> login(LoginReq body) async {
    var _url = Uri.parse("$BASE_URL/vvlanding/auth/login");
    var _body = jsonEncode(body.toJson());

    var response = await http.post(_url, headers: await baseHeaders, body: _body);
    final value = GeneralDataApi<LoginRes>.fromJson(
        map: middleware(response),
        renderData: (_map) => LoginRes.fromJson(_map));
    return value;
  }
}
