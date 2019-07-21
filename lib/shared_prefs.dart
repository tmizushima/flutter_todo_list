import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  static final list_Items = "list_items";
  static final completed_Items = "completed_items";
  static SharedPreferences _sharedPreferences;

  static Future setInstance() async {
    if (null != _sharedPreferences) return;

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setListItems(List<String> value) =>
      _sharedPreferences.setStringList(list_Items, value);
  static List<String> getListItems() =>
      _sharedPreferences.getStringList(list_Items) ?? [];

  static Future<bool> setCompletedItems(List<String> value) =>
      _sharedPreferences.setStringList(completed_Items, value);
  static List<String> getCompletedItems() =>
      _sharedPreferences.getStringList(completed_Items) ?? [];
}
