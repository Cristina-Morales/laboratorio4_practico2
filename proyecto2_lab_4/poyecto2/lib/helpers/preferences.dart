import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static bool _darkMode = false;
  static late SharedPreferences _preferences;

  static Future<void> initShared() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool get darkMode{
    return _preferences.getBool('darkMode') ?? _darkMode;
  }

  static set darkMode(bool value){
    _darkMode = value;
    _preferences.setBool('darkMode', value);
  }
  
}