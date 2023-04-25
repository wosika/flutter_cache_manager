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
}
