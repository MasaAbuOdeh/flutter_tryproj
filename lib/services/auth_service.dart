import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/constants/error_handling.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/constants/utils.dart';
import 'package:flutter_try/models/Admin.dart';
import 'package:flutter_try/models/user.dart';
import 'package:flutter_try/pages/SignUpScreen.dart';
import 'package:flutter_try/pages/welcome_page.dart';
import 'package:flutter_try/providers/Admin_provider.dart';
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
         statu: '',
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
          Navigator.of(context).pushNamed('started');Colors.red[200];

          
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //sign up admin 
   //signup user
  void signUpAdmin({
    required BuildContext context,
    required String email,
    required String password,
  }) async{
    try{
      Admin user = Admin(id: '', 
      email: email,
        password: password,
          token: '',
          );

          http.Response res = await http.post(
            Uri.parse('$uri/Admin/signup'),
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
  void signInAdmin({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/Admin/signin'),
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
          Provider.of<AdminProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.of(context).pushNamed('Adminside');Colors.red[200];

          
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void logout(BuildContext context)async{
    try {
      
SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
await sharedPreferences.setString('x-auth-token', '');
 Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => WelcomePage(),
                            ),
                          );
    }
    catch(e){
      showSnackBar(context, e.toString());

    }
  }

  //get all users
  Future<List<User>>showAlluser(BuildContext context) async {
  
  
  List <User> allusers =[];
  try {
          http.Response res = await http.get(Uri.parse('$uri/user/all'), headers:{
          'Content-Type': 'application/json; charset=UTF-8',
          }
          ) ;   

          httpErrorHandel(response: res, context: context, onSuccess: () {
            for (int i =0; i < jsonDecode(res.body).length;i++){
            allusers.add(User.fromJson(jsonEncode(jsonDecode(res.body)[i],
              ),
              ),
              );
            }
          });
  } catch (e) {
              showSnackBar(context, e.toString());
  }
  return allusers;

}
//delete user
void deleteuser({
    required BuildContext context,
    required User user,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-user'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': user.id,
        }),
      );

      httpErrorHandel(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //send noti info 
 
void sendNoti({
required BuildContext context,
required String name,
required String Notititle,
required String Notibody,





}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  try {
       
       http.Response res = await http.post(
        Uri.parse('$uri/api/send-Noti'),
        
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'name':name,
          'Notititle':Notititle,
          'Notibody':Notibody,
        }), );
        httpErrorHandel(
        response: res,
        context: context,
        onSuccess: () {
          //showSnackBar(context, 'we send notification to user',);
         // Navigator.pop(context);
        },
      ); 
      


       

  }catch(e){
    showSnackBar(context, e.toString());
  }

}


}