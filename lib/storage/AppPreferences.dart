import 'package:dichvubonmua/utils/Encryption.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

enum AppPrefKey{
  /*
  * String
  * */

  LOGIN_INFO,
  SHOP_INFO
  /*
  * INT
  * */
}


class AppPreferences {


  static AppPreferences? _instance;
  AppPreferences._internal();

  factory AppPreferences(){
    _instance = _instance ?? new AppPreferences._internal();
    return _instance!;
  }
  SharedPreferences? _sharedPreferences;
  Encryption _encryption = new Encryption() ;
  init() async {
    _sharedPreferences = _sharedPreferences ?? await SharedPreferences.getInstance();
    return _sharedPreferences;
  }

  String get defaultString => "*";
  saveString({required AppPrefKey key, required String str, bool isEncode=false}) {

    _sharedPreferences!.setString(key.toString(), (!isEncode)?str:_encryption.encrypt(str));
  }
  String getString({required AppPrefKey key,  bool isEncode=false}) {
    String? str = _sharedPreferences!.getString(key.toString());
    if(str == null){
      return defaultString;
    }else{
      return (!isEncode)?str:_encryption.decrypt(str);
    }
  }

  int get defaultInt => -3498;
  saveInt({required AppPrefKey key, required int numb}) {
    _sharedPreferences?.setInt(key.toString(), numb);
  }
  int getInt({required AppPrefKey key}) {
    return _sharedPreferences?.getInt(key.toString())??defaultInt;
  }

  removeKey({required AppPrefKey key}){
    _sharedPreferences?.remove(key.toString());
  }

  String getDeviceToken() {
    var deviceToken = _sharedPreferences?.getString("device_token");
    if (deviceToken == null) {
      deviceToken = Uuid().v4();
      _sharedPreferences?.setString("device_token", deviceToken);
    }
//    return "ba199a66-610a-43d5-a5bc-2899ce2d0c76";
    return deviceToken;
  }

}

