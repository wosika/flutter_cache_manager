abstract class ICache {
  //初始化
  Future<void> init({ICache? cache});

  //获取string
  String getString(String key, {String defaultValue = ""});

  //设置string
  void putString(String key, String value);

  //获取string集合
  void putStringList(String key, List<String> value);

  //设置string集合
  List<String> getStringList(String key, {List<String> defaultValue});

  //设置int
  void putInt(String key, int value);

  //获取int
  int getInt(String key, {int defaultValue = 0});


  //设置double
  void putDouble(String key, double value);

  //获取double
  double getDouble(String key, {double defaultValue = 0.0});

  //设置bool
  void putBool(String key, bool value);

  //获取bool
  bool getBool(String key, {bool defaultValue = false});

  //移除
  void remove(String key);

  //清空
  void clear();
}
