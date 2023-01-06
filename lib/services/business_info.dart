import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_try/constants/error_handling.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/constants/utils.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class business_info {
void sendinfo({
required BuildContext context,
required String name,
required String discreption,
required List<File> images,
required double price,
required String location,
required double latitude,
required double longitude,



}) async {
  final workerProvider = Provider.of<WorkerProvider>(context, listen: false);
  try {
       final cloudinary = CloudinaryPublic('dsfi1i0ag', 'n4ze2xzx');
       List<String> imageUrls = [];

       for (int i=0; i<images.length;i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path,folder: name));
          imageUrls.add(res.secureUrl);
       }
       http.Response res = await http.post(
        Uri.parse('$uri/api/send-info'),
        
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
         // 'x-auth-token': WorkerProvider.worker.token,
        },
        body: jsonEncode({
          'name': name,
          'discreption': discreption,
          'images':imageUrls,
          'price': price,
          'location': location,
          'latitude' :latitude,
          'longitude':longitude,
        }), );
        httpErrorHandel(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'info send successfully ! it will be shown in the user side',);
         // Navigator.pop(context);
        },
      ); 
      


       

  }catch(e){
    showSnackBar(context, e.toString());
  }

}

void useractivate({
required BuildContext context,
required String name,
required String statu,




}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  try {
       
       http.Response res = await http.post(
        Uri.parse('$uri/api/activate_user'),
        
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
         // 'x-auth-token': WorkerProvider.worker.token,
        },
        body: jsonEncode({
          'name': name,
          'statu': statu,
        }), );
        httpErrorHandel(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'user activated now',);
         // Navigator.pop(context);
        },
      );
   

  }catch(e){
    showSnackBar(context, e.toString());
  }

  

}

void workeractivate({
required BuildContext context,
required String name,
required String statu,




}) async {
  final workerProvider = Provider.of<WorkerProvider>(context, listen: false);
  try {
       
       http.Response res = await http.post(
        Uri.parse('$uri/api/activate_worker'),
        
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
         // 'x-auth-token': WorkerProvider.worker.token,
        },
        body: jsonEncode({
          'name': name,
          'statu': statu,
        }), );
        httpErrorHandel(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'worker activated now',);
         // Navigator.pop(context);
        },
      );
   

  }catch(e){
    showSnackBar(context, e.toString());
  }

  

}





}