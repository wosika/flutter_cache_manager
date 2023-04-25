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
}
