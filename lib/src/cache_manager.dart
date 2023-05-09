import 'package:cache_manager/src/hive_cache.dart';
import 'package:cache_manager/src/shared_cache.dart';
import 'i_cache.dart';

class CacheManager extends ICache {
  late ICache _cache;

  //-----------------单例------------------ start
  factory CacheManager() => _getInstance();

  static CacheManager get instance => _getInstance();
  static CacheManager? _instance;

  CacheManager._internal() {
    // 初始化
  }

  static CacheManager _getInstance() {
    _instance ??= CacheManager._internal();
    return _instance!;
  }

//-----------------单例------------------ end

  @override
  String getString(String key, {String defaultValue = ""}) {
    return _cache.getString(key, defaultValue: defaultValue);
  }

  //初始化要在runApp()之前
  @override
  Future<void> init({ICache? cache}) async {
    _cache = cache ?? SharedCache();
    await _cache.init();
  }

  @override
  void putString(String key, String value) {
    _cache.putString(key, value);
  }

  @override
  List<String> getStringList(String key, {List<String>? defaultValue}) {
    return _cache.getStringList(key, defaultValue: defaultValue ?? []);
  }

  @override
  void putStringList(String key, List<String> value) {
    _cache.putStringList(key, value);
  }

  @override
  void clear() {
    _cache.clear();
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return _cache.getBool(key, defaultValue: defaultValue);
  }

  @override
  double getDouble(String key, {double defaultValue = 0.0}) {
    return _cache.getDouble(key, defaultValue: defaultValue);
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return _cache.getInt(key, defaultValue: defaultValue);
  }

  @override
  void putBool(String key, bool value) {
    _cache.putBool(key, value);
  }

  @override
  void putDouble(String key, double value) {
    _cache.putDouble(key, value);
  }

  @override
  void putInt(String key, int value) {
    _cache.putInt(key, value);
  }

  @override
  void remove(String key) {
    _cache.remove(key);
  }

  @override
  String get name => _cache.name;
}
