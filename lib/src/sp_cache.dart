
import 'package:shared_preferences/shared_preferences.dart';

import 'i_cache.dart';

class SPCache extends ICache {
  late SharedPreferences _pref;

  @override
  String getString(String key, {String defaultValue = ""}) {
    return _pref.getString(key) ?? defaultValue;
  }

  @override
  Future<void> init({ICache? cache}) async {
    _pref = await SharedPreferences.getInstance();
  }

  @override
  void putString(String key, String value) {
    if (value.isNotEmpty) {
      _pref.setString(key, value);
    } else {
      _pref.remove(key);
    }
  }

  @override
  List<String> getStringList(String key, {List<String>? defaultValue}) {
    return _pref.getStringList(key) ?? defaultValue??[];
  }

  @override
  void putStringList(String key, List<String> value) {
    if (value.isNotEmpty) {
      _pref.setStringList(key, value);
    } else {
      _pref.remove(key);
    }
  }
}
