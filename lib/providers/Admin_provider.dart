import 'package:flutter/material.dart';
import 'package:flutter_try/models/Admin.dart';

class AdminProvider extends ChangeNotifier {
  Admin _admin = Admin(
    id: '',
    email: '',
    password: '',
    token: '',
    
  );

  Admin get user => _admin;

  void setUser(String admin) {
    _admin = Admin.fromJson(admin);
    notifyListeners();
  }

  void setUserFromModel(Admin admin) {
    _admin = admin;
    notifyListeners();
  }
}