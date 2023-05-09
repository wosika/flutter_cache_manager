import 'package:hive_flutter/hive_flutter.dart';
import 'i_cache.dart';

class HiveCache extends ICache {
  @override
  String get name => "Flutter";

  late Box box;

  @override
  String getString(String key, {String defaultValue = ""}) {
    return box.get(key, defaultValue: defaultValue);
  }

  @override
  Future<void> init({ICache? cache}) async {
    await Hive.initFlutter();
    box = await Hive.openBox(name);
  }

  @override
  void putString(String key, String value) {
    if (value.isNotEmpty) {
      box.put(key, value);
    } else {
      box.delete(key);
    }
  }

  @override
  List<String> getStringList(String key, {List<String>? defaultValue}) {
    return box.get(key) ?? defaultValue ?? [];
  }

  @override
  void putStringList(String key, List<String> value) {
    box.put(key, value);
  }

  @override
  void clear() {
    box.clear();
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return box.get(key) ?? defaultValue;
  }

  @override
  double getDouble(String key, {double defaultValue = 0.0}) {
    return box.get(key) ?? defaultValue;
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return box.get(key) ?? defaultValue;
  }

  @override
  void putBool(String key, bool value) {
    box.put(key, value);
  }

  @override
  void putDouble(String key, double value) {
    box.put(key, value);
  }

  @override
  void putInt(String key, int value) {
    box.put(key, value);
  }

  @override
  void remove(String key) {
    box.delete(key);
  }

  @override
  Future<void> refresh() async {
    await box.flush();
  }
}
