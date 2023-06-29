import 'package:shared_preferences/shared_preferences.dart';
enum SharedKeys{
  isDarkMode,
}

class SharedManager {

  static late SharedPreferences _prefs;

  // call this method from initState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  //sets
  static Future<bool> setBool(SharedKeys key, bool value) async =>
      await _prefs.setBool(key.name, value);

  static Future<bool> setDouble(SharedKeys key, double value) async =>
      await _prefs.setDouble(key.name, value);

  static Future<bool> setInt(SharedKeys key, int value) async =>
      await _prefs.setInt(key.name, value);

  static Future<bool> setString(SharedKeys key, String value) async =>
      await _prefs.setString(key.name, value);

  static Future<bool> setStringList(SharedKeys key, List<String> value) async =>
      await _prefs.setStringList(key.name, value);

  //gets
  static bool? getBool(SharedKeys key) => _prefs.getBool(key.name);

  static double? getDouble(SharedKeys key) => _prefs.getDouble(key.name);

  static int? getInt(SharedKeys key) => _prefs.getInt(key.name);

  static String? getString(SharedKeys key) => _prefs.getString(key.name);

  static List<String>? getStringList(SharedKeys key) => _prefs.getStringList(key.name);

  //deletes..
  static Future<bool> remove(SharedKeys key) async => await _prefs.remove(key.name);

  static Future<bool> clear() async => await _prefs.clear();
}