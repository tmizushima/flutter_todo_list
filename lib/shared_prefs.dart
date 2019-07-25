import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  static final green_list_Items = "green_list_items";
  static final green_completed_Items = "green_completed_items";
  static final yellow_list_Items = "yellow_list_items";
  static final yellow_completed_Items = "yellow_completed_items";
  static final red_list_Items = "red_list_items";
  static final red_completed_Items = "red_completed_items";
  static SharedPreferences _sharedPreferences;

  static Future setInstance() async {
    if (null != _sharedPreferences) return;

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setGreenListItems(List<String> value) =>
      _sharedPreferences.setStringList(green_list_Items, value);
  static List<String> getGreenListItems() =>
      _sharedPreferences.getStringList(green_list_Items) ?? [];

  static Future<bool> setGreenCompletedItems(List<String> value) =>
      _sharedPreferences.setStringList(green_completed_Items, value);
  static List<String> getGreenCompletedItems() =>
      _sharedPreferences.getStringList(green_completed_Items) ?? [];

  static Future<bool> setYellowListItems(List<String> value) =>
      _sharedPreferences.setStringList(yellow_list_Items, value);
  static List<String> getYellowListItems() =>
      _sharedPreferences.getStringList(yellow_list_Items) ?? [];

  static Future<bool> setYellowCompletedItems(List<String> value) =>
      _sharedPreferences.setStringList(yellow_completed_Items, value);
  static List<String> getYellowCompletedItems() =>
      _sharedPreferences.getStringList(yellow_completed_Items) ?? [];

  static Future<bool> setRedListItems(List<String> value) =>
      _sharedPreferences.setStringList(red_list_Items, value);
  static List<String> getRedListItems() =>
      _sharedPreferences.getStringList(red_list_Items) ?? [];

  static Future<bool> setRedCompletedItems(List<String> value) =>
      _sharedPreferences.setStringList(red_completed_Items, value);
  static List<String> getRedCompletedItems() =>
      _sharedPreferences.getStringList(red_completed_Items) ?? [];
}
