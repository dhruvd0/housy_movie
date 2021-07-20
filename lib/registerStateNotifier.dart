import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterStateNotifier extends ChangeNotifier {
  late String name, password, email, phone, profession;
  void register() async {
    SharedPreferences s = await SharedPreferences.getInstance();
   await s.setString(name, password);
  }

  void changeField(data, RegisterFields field) {
    switch (field) {
      case RegisterFields.name:
        name = data;
        break;
      case RegisterFields.password:
        password = data;
        break;
      case RegisterFields.email:
        email = data;
        break;
      case RegisterFields.phone:
        phone = data;
        break;
      case RegisterFields.profession:
        profession = data;
        break;
    }
    notifyListeners();
  }
}

enum RegisterFields { name, password, email, phone, profession }
