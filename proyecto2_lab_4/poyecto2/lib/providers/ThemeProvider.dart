// ignore: file_names
import 'package:flutter/material.dart';
import 'package:poyecto2/helpers/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool get darkMode {
    return Preferences.darkMode;
  }

  changeTheme(bool darkMode) {
    Preferences.darkMode = darkMode;
    notifyListeners();
  }
}
