import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/model/user_model.dart';

class MyProvider extends ChangeNotifier {

  SharedPreferences? sharedPreferences;
  User? firebaseUser;
  UserModel? userModel;
  String languageCode = "en";
  late ThemeMode themeMode ;

  MyProvider(){
    firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser != null){
      initUser();
    }
  }

  Future<void> setItems()async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(getTheme()??false){
      themeMode = ThemeMode.light;
    }else{
      themeMode = ThemeMode.dark;
    }
  }


  initUser() async{
    userModel = await FirebaseFunctions.getUserData();
    notifyListeners();
  }

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    isLightMood()? saveTheme(true): saveTheme(false);
    notifyListeners();
  }

  bool isLightMood() {
    return themeMode == ThemeMode.light ? true : false;
  }

  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  Future<void> saveTheme(bool isLight)async{
    await sharedPreferences!.setBool("isLight", isLight);
  }

  bool? getTheme(){
    return sharedPreferences!.getBool("isLight");
  }
}
