import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/constants/error_handling.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/constants/utils.dart';
import 'package:flutter_try/models/user.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkerAuthService {

  //signup user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
    required String phone,
    required String type,
   // required String discreption,
    //required List<String> images,
    //required double price,
    //required String location,

  }) async{
    try{
      Worker worker = Worker(id: '', 
      email: email,
       name: name,
        password: password,
         phone: phone,
         type : type,
         discreption: '',
         images: [],
         price: 0.0,
         location: '',
         latitude: 0.0,
         longitude: 0.0,
          token: '',

          );

          http.Response res = await http.post(
            Uri.parse('$uri/api/Workersignup'),
            body: worker.toJson(),
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
        Uri.parse('$uri/api/Workersignin'),
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
          Provider.of<WorkerProvider>(context, listen: false).setWorker(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.of(context).pushNamed('businessScreen');Colors.red[200];

          
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Worker>>showAllhalls(BuildContext context) async {
  
  
  List <Worker> workerhalls =[];
  try {
          http.Response res = await http.get(Uri.parse('$uri/business/get-halls'), headers:{
          'Content-Type': 'application/json; charset=UTF-8',
          }
          ) ;   

          httpErrorHandel(response: res, context: context, onSuccess: () {
            for (int i =0; i < jsonDecode(res.body).length;i++){
            workerhalls.add(Worker.fromJson(jsonEncode(jsonDecode(res.body)[i],
              ),
              ),
              );
            }
          });
  } catch (e) {
              showSnackBar(context, e.toString());
  }
  return workerhalls;

}


Future<List<Worker>>showrecomendedhalls(BuildContext context) async {
  
  
  List <Worker> workerhalls =[];
  try {
          http.Response res = await http.get(Uri.parse('$uri/business/get-halls'), headers:{
          'Content-Type': 'application/json; charset=UTF-8',
          }
          ) ;   

          httpErrorHandel(response: res, context: context, onSuccess: () {
            for (int i =0; i < jsonDecode(res.body).length;i++){
            workerhalls.add(Worker.fromJson(jsonEncode(jsonDecode(res.body)[i],
              ),
              ),
              );
            }
          });
  } catch (e) {
              showSnackBar(context, e.toString());
  }
  return workerhalls;

}

}