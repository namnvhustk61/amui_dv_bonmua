class User {

  int id;
  String username;
  bool active;
  String image;
  String title;
  String phone;
  String email;
  String authorities;
  bool enabled;
  bool accountNonLocked;
  bool credentialsNonExpired;
  bool accountNonExpired;

  User.fromJson(Map<String, dynamic> map):
        id = map["id"],
        username = map["username"],
        active = map["active"],
        image = map["image"],
        title = map["title"],
        phone = map["phone"],
        email = map["email"],
        authorities = map["authorities"],
        enabled = map["enabled"],
        accountNonLocked = map["accountNonLocked"],
        credentialsNonExpired = map["credentialsNonExpired"],
        accountNonExpired = map["accountNonExpired"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['active'] = active;
    data['image'] = image;
    data['title'] = title;
    data['phone'] = phone;
    data['email'] = email;
    data['authorities'] = authorities;
    data['enabled'] = enabled;
    data['accountNonLocked'] = accountNonLocked;
    data['credentialsNonExpired'] = credentialsNonExpired;
    data['accountNonExpired'] = accountNonExpired;
    return data;
  }
}