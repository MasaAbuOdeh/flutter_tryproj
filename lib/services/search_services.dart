import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_try/constants/error_handling.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/constants/utils.dart';
import 'package:flutter_try/models/comment.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/Admin_provider.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class search_services{
Future<List<Worker>>search(BuildContext context,
 String searchQuery) async {
  
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  List <Worker> workerhalls =[];
  try {
          http.Response res = await http.get(Uri.parse('$uri/business/search/$searchQuery'), headers:{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
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

Future<List<Worker>>searchAdmin(BuildContext context,
 String searchQuery) async {
  
  final adminProvider = Provider.of<AdminProvider>(context, listen: false);
  List <Worker> workerhalls =[];
  try {
          http.Response res = await http.get(Uri.parse('$uri/business/adminsearch/$searchQuery'), headers:{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': adminProvider.user.token,
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

Future<List<Comment>>showallcomments( BuildContext context,
     String workername) async {

      final workerProvider = Provider.of<WorkerProvider>(context, listen: false);
      
  
  List <Comment> allcomments =[];
  try {
          http.Response res = await http.get(Uri.parse('$uri/business/get-comments/$workername'), headers:{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': workerProvider.worker.token,
          }
          ) ;   

          httpErrorHandel(response: res, context: context, onSuccess: () {
            for (int i =0; i < jsonDecode(res.body).length;i++){
            allcomments.add(Comment.fromJson(jsonEncode(jsonDecode(res.body)[i],
              ),
              ),
              );
            }
          });
  } catch (e) {
              showSnackBar(context, e.toString());
  }
  return allcomments;

}

}