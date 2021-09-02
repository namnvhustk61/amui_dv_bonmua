

import 'User.dart';

class LoginRes {

  String accessToken;
  String tokenType;
  User user;

  LoginRes.fromJson(Map<String, dynamic> map):
        accessToken = map["accessToken"],
        tokenType = map["tokenType"],
        user = User.fromJson(map["user"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = accessToken;
    data['tokenType'] = tokenType;
    data['user'] = user;
    return data;
  }

}