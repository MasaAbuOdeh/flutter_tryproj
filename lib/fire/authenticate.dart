import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/fire/login.dart';
import 'package:flutter_try/fire/search.dart';


class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return search();
    } else {
      return LoginScreen();
    }
  }
}