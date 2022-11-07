import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/constants/error_handling.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/constants/utils.dart';
import 'package:flutter_try/models/user.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  //signup user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
    required String phone,
  }) async{
    try{
      User user = User(id: '', 
      email: email,
       name: name,
        password: password,
         phone: phone,
          token: '',
          );

          http.Response res = await http.post(
            Uri.parse('$uri/api/signup'),
            body: user.toJson(),
            headers: <String, String>{
            'content-Type': 'application/json; charest=UTF-8',
            },
            );
            httpErrorHandel(response: res,
             context: context,
              onSuccess: (){
                showSnackBar(context, 'Account created ! Login with the same created',);
              },
              );


    } catch(e) {
      showSnackBar(context, e.toString());

    }

  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandel(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.of(context).pushNamed('HomePage');Colors.red[200];

          
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}