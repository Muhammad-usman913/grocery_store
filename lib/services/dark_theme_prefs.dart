
 import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs{

  static const  THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }
  Future<bool> getDarkTheme()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(THEME_STATUS) ?? false;
  }
 }