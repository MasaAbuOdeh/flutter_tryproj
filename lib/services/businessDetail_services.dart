import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_try/constants/error_handling.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/constants/utils.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class businessDetail_services{
  void rateProduct({
    required BuildContext context,
    required Worker worker,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-Worker'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': worker.id!,
          'rating': rating,
        }),
      );

      httpErrorHandel(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  void Commentbusiness({
    required BuildContext context,
    required Worker worker,
    required String comment,
    required String username,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/comment-Worker'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': worker.id!,
          'comment': comment,
          'username': userProvider.user.name,
        }),
      );

      httpErrorHandel(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}