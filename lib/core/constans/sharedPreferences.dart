import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static String dartMode = 'isDartMode';
  static String systemMode = 'isSystemMode';
  static String userID = 'userID';

  //!save data
  static Future<bool> saveisDartMode(bool isDartMode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(dartMode, isDartMode);
  }

  static Future<bool> saveUserID(String userId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userID, userId);
  }

  static Future<bool> saveisSystemMode(bool isSystemMode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(systemMode, isSystemMode);
  }
  //!end save data

  //todo get data
  static getisDartMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(dartMode) ?? false;
  }

  static getGetuserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(userID) ?? 'null';
  }

  static getiisSystemMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(systemMode) ?? false;
  }
  //todo ned get data
}
