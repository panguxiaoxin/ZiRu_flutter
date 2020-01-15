import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SpManager {
  SharedPreferences _sharedPreferences;

  Future<bool> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return true;
  }

  String getString(String key) {
    return _sharedPreferences.getString(key);
  }

  Future<bool> saveString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  Future<bool> deleteString(String key) {
    return _sharedPreferences.remove(key);
  }
}
