import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStateNotifier extends ChangeNotifier {
  late String name, password;
  void changeName(String name) {
    this.name = name;
    notifyListeners();
  }

  void changePassword(String pass) {
    password = pass;
    notifyListeners();
  }

  Future<bool> validate() async {
    try {
      SharedPreferences s = await SharedPreferences.getInstance();
      String pass = (s.getString(name)) as String;
      return pass == password;
    } catch (e) {
      return false;
    }
    
  }
}
