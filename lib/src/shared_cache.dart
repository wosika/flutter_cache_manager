import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'i_cache.dart';



class SharedCache extends ICache {
  late SharedPreferences sharedPreferences;
  @override
  String getString(String key, {String defaultValue = ""}) {
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  @override
  Future<void> init({ICache? cache}) async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void putString(String key, String value) {
    if (value.isNotEmpty) {
      sharedPreferences.setString(key, value);  
    } else {
      sharedPreferences.remove(key);
    }
  }

  @override
  List<String> getStringList(String key, {List<String>? defaultValue}) {
    var decodeString = sharedPreferences.getString(key);
    if (decodeString != null && decodeString.isNotEmpty) {
      List<dynamic> data = jsonDecode(decodeString) ;
      return data.map((e) => e.toString()).toList();
    }
    return defaultValue??[];
  }

  @override
  void putStringList(String key, List<String> value) {
    if (value.isNotEmpty) {
      sharedPreferences.setString(key, jsonEncode(value));
    } else {
      sharedPreferences.remove(key);
    }
  }
}
