
import 'package:flutter/cupertino.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:provider/provider.dart';

class profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      child: Center(child: Text(user.name)),
    );
    throw UnimplementedError();
  }

}