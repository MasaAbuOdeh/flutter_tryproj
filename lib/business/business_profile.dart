import 'package:flutter/material.dart';
import 'package:flutter_try/business/calendar_nofire/calendar.dart';
import 'package:flutter_try/business/notification.dart';
import 'package:flutter_try/fire/search.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/auth_service.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget{
  const profile({Key? key}):super(key:key);
  @override
  _profileState createState()=> _profileState();


}
class _profileState extends State<profile>{
  DateTime dateTime=DateTime(2022,22,11,0,0);
  final AuthService closee =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          body: Container(
           width: double.maxFinite,
           height: double.maxFinite,
            color: Colors.white,




            child: ListView(
              children: [
                SizedBox(height: 50,),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),
                    child:
                      MaterialButton(
                    // padding: const EdgeInsets.symmetric(horizontal: 40),
                  minWidth: double.minPositive,
                  height: 60,

                  onPressed: () {
                    print('info btn Pressed');
                    
                  } ,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromARGB(236, 216, 169, 74),
                      width: 3),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  color: Colors.white,
child:Row(
    children: [
      Icon(Icons.account_circle_outlined,color:Color.fromARGB(236, 216, 169, 74),size: 25,),
                  const Text(
                    '\t\t\tAccount',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(236, 216, 169, 74),
                      fontSize: 25,
                      fontWeight: FontWeight.normal,


                    ),

                  )
                    ]    //TextButton.icon(onPressed: (){}, icon: Icons.account_circle_outlined, label: "");
                )
                    ),

                    ),

              //  SizedBox(height: 10,),

                
                SizedBox(height: 20,width: 40,),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),
                    child: MaterialButton(

                      minWidth: double.infinity,
                      height: 60,
                      onPressed: (){
                        print('info btn Pressed');
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => notification(),
                            ),
                          );
                      } ,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(236, 216, 169, 74),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        Icon(Icons.notifications_outlined,color:Color.fromARGB(236, 216, 169, 74),size: 25,),
                       const Text(
                        '\t\t\tPush Notification',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(236, 216, 169, 74),
                          fontSize: 25,
                          fontWeight: FontWeight.normal,


                        ),
                       ),

                        ]
                      )
                    ),),
                SizedBox(height: 20,),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),

                    child: MaterialButton(

                      minWidth:double.minPositive,
                      height: 60,

                      onPressed: () { print('info btn Pressed');
                      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Calendar()
                            ),
                          );},
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(236, 216, 169, 74),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                        child:Row(
                            children: [
                              Icon(Icons.bookmark_add_outlined,color:Color.fromARGB(236, 216, 169, 74),size: 25,),

                        const Text(
                         '\t\t\t Bookings',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(236, 216, 169, 74),
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Schyler-Regular',


                          ),
                        ),

                        ]
                    )
                ),),
                SizedBox(height: 20,),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),
                    child: MaterialButton(

                      minWidth: double.minPositive,
                      height: 60,
                      onPressed: () => print('info btn Pressed'),

                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(236, 216, 169, 74),
                            width: 3
                         ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        IconButton(
                              onPressed: () {
                                closee.logout(context);
                              },
                              icon: Icon(Icons.dangerous_outlined,color: Color.fromARGB(236, 216, 169, 74),),
                            ),
                       const Text(
                        '\t\t\tLog Out',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(236, 216, 169, 74),
                          fontSize: 25,
                          fontWeight: FontWeight.normal,

                        ),
                       ),

                        ]
                      )
                    ),),
                SizedBox(height: 20,width: 20),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),
                    child: MaterialButton(

                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () => print('info btn Pressed'),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(236, 216, 169, 74),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        Icon(Icons.phone_iphone_outlined,color:Color.fromARGB(236, 216, 169, 74),size: 25,),
                    const Text(
                        '\t\t\tAbout us',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(236, 216, 169, 74),
                          fontSize: 25,
                          fontWeight: FontWeight.normal,


                        ),
                    ),

                        ]
                      )
                    ),
                ),
            ]

    )
        )
);

  }
}