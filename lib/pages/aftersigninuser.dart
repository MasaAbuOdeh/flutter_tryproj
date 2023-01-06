import 'package:flutter/material.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/widget/ResponsiveButton.dart';
import 'package:provider/provider.dart';

class after_signin_usr extends StatefulWidget {
  const after_signin_usr({super.key});

  @override
  State<after_signin_usr> createState() => _after_signin_usrState();
}

class _after_signin_usrState extends State<after_signin_usr> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    // TODO: implement build
    return Container(
            width:double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:NetworkImage(
                  "https://i.pinimg.com/564x/54/fd/c8/54fdc841892c90d3a10361955e1e3d90.jpg"
                ), fit:BoxFit.cover)
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 500, left: 20, right: 20),
                  child: Row(
                    children: [
                       ClipRRect(
        borderRadius:BorderRadius.circular(20),
       child: ElevatedButton(
          child:  Text('get started',style: TextStyle(fontSize: 25,color: Colors.white),) ,
          style: ElevatedButton.styleFrom(primary: Colors.black87),
          
        
          onPressed: (){
            if(user.statu=='activate'){
              Navigator.of(context).pushNamed('started');Colors.red[200];
            }
            else {print(user.statu);
            }
            }),
                       )
                               
                    ]
                    )
                    )

                );
  
  }

}

