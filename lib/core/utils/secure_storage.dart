import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }


  Future readSecureData(String token) async {
    var readData = await _storage.read(key: token);
    // var readData = await _storage.read(key: refreshToken);

    return readData;
  }

  Future deleteSecureData() async {
    var deleteData = await _storage.delete(key: "remem_token");

    return deleteData;
  }


  Future logout() async {
    try {
      await _storage.delete(key: "username");
      await _storage.delete(key: "password");
      await _storage.delete(key: "isSelected");
      return true;
    } on Exception catch (_) {
      return false;
    }


  }

  Future savePreferences(String token,) async {
    await _storage.write(key: "remem_token", value: token);


  }




}
