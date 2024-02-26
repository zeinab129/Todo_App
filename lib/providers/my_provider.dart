import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.system;

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  bool isLightMood() {
    return themeMode == ThemeMode.light ? true : false;
  }

  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }
}
