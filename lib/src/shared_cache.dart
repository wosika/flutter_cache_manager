import 'package:shared_preferences/shared_preferences.dart';
import 'i_cache.dart';

class SharedCache extends ICache {
  @override
  String get name => "Flutter";

  late SharedPreferences sharedPreferences;

  @override
  String getString(String key, {String defaultValue = ""}) {
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  @override
  Future<void> init({ICache? cache}) async {
    SharedPreferences.setPrefix(name);
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
    return sharedPreferences.getStringList(key) ?? defaultValue ?? [];
  }

  @override
  void putStringList(String key, List<String> value) {
    sharedPreferences.setStringList(key, value);
  }

  @override
  void clear() {
    sharedPreferences.clear();
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  @override
  double getDouble(String key, {double defaultValue = 0.0}) {
    return sharedPreferences.getDouble(key) ?? defaultValue;
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return sharedPreferences.getInt(key) ?? defaultValue;
  }

  @override
  void putBool(String key, bool value) {
    sharedPreferences.setBool(key, value);
  }

  @override
  void putDouble(String key, double value) {
    sharedPreferences.setDouble(key, value);
  }

  @override
  void putInt(String key, int value) {
    sharedPreferences.setInt(key, value);
  }

  @override
  void remove(String key) {
    sharedPreferences.remove(key);
  }

  @override
  Future<void> refresh() async {
    await sharedPreferences.reload();
  }




}
