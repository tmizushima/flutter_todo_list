import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  static final _itemName = "item_name";
  static final _listItems = "list_items";
  static final _completedItems = "completed_items";
  static SharedPreferences _sharedPreferences;

  static Future setInstance() async {
    if (null != _sharedPreferences) return;

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setItemName(String value) =>
      _sharedPreferences.setString(_itemName, value);
  static String getItemName() => _sharedPreferences.getString(_itemName);

  static Future<bool> setListItems(List<String> value) =>
      _sharedPreferences.setStringList(_listItems, value);
  static List<String> getListItems() =>
      _sharedPreferences.getStringList(_listItems) ?? [getItemName()];
}
