import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode =
  ((SchedulerBinding.instance.platformDispatcher.platformBrightness) ==
      Brightness.dark)
      ? ThemeMode.dark
      : ThemeMode.light;

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
