
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/common/widgets/stars.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/pages/recomanded.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/business_info.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:flutter_try/widget/loader.dart';
import 'package:flutter_try/widget/single.dart';
import 'package:provider/provider.dart';
class recomended extends StatefulWidget{
const recomended({Key? key}):super(key:key);

  //get workers => null;
  get recomend=> null;
 // get temp =>null;
  //get workerdata => null;
@override
_recomendedState createState()=> _recomendedState();


}
class _recomendedState extends State<recomended> with TickerProviderStateMixin {
  
   


@override


  


  

   
   

  @override
  Widget build(BuildContext context) {

   // initState();
        final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body:Center(child:Text(user.name),) ,

    );
   
        
    
    
}
}
