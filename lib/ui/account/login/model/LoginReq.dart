
class LoginReq {
  String username;
  String password;

  LoginReq({required this.username, required this.password});
  LoginReq.fromJson(Map<String, dynamic> map):
        username = map["username"],
        password = map["password"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}