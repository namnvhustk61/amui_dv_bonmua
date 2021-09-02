
import 'package:dichvubonmua/utils/Encryption.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = new FlutterSecureStorage();
  Encryption _encryption = new Encryption();

  savePhone(String phone) async {
    await _storage.write(key: "us", value: _encryption.encrypt(phone));
  }

  Future<String> getPhone() async {
    var phone = await _storage.read(key: "us") != null ? _encryption.decrypt( await _storage.read(key: "us")) : "";
    return phone??"";
  }
  removePhone(){
    _storage.delete(key: "us");
  }
  savePassword(String password) async {
    await _storage.write(key: "pw", value: _encryption.encrypt(password));
  }
  Future<String> getPassword() async {
    String pw = await _storage.read(key: "pw") != null ? _encryption.decrypt(await _storage.read(key: "pw")): "";
    return  pw??"";
  }
  removePassword(){
    _storage.delete(key: "pw");
  }
}
