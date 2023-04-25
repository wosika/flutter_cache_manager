# CacheManager
## 概述
CacheManager 是一个缓存管理器,内部持有一个 ICache 实现(默认为 SharedCache),并将外部调用转发给内部持有的 ICache 实现。
## 使用方法
1. 首先调用 init() 进行初始化。可以通过传入 cache 参数指定自定义的 ICache 实现,如果为 null 则使用 SharedCache 默认实现。
   实现这个接口的类可以有:
- SharedPreferencesCache:使用 SharedPreferences 实现的缓存。
- MemCache:使用内存实现的简单缓存。
- DatabaseCache:使用数据库实现的缓存。
   dart
   CacheManager.instance.init();
   // 或者
   CacheManager.instance.init(cache: MyCache());
2. 调用 getString()、putString()、getStringList()、putStringList() 进行缓存操作。这些调用会被转发到内部的 ICache 实现上。
   dart
   CacheManager.instance.putString("key", "value");
   CacheManager.instance.getString("key");
   CacheManager.instance.putStringList("list_key", ["a", "b", "c"]);
   CacheManager.instance.getStringList("list_key");
3. 可以通过 CacheManager.instance 获取单例实例。
   dart
   CacheManager.instance
## 设计思路
这个 CacheManager 类实现了缓存的集中管理与维护,外部通过统一的接口与之交互,而内部具体由哪种缓存实现负责则由 CacheManager 决定和维护。这实现了高内聚低耦合的设计。
## 内部结构
dart
class CacheManager extends ICache {
late ICache _cache;    // 持有的 ICache 实现实例

//...

// 转发方法实现
String getString(String key, {String defaultValue = ""}) {
return _cache.getString(key, defaultValue: defaultValue);
}

//...
}
外部调用会被转发到 _cache 持有的 ICache 实例上,而该实例则由 init() 方法在初始化时指定。