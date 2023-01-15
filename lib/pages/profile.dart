
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/business/calendar_nofire/allclientbooking.dart';
import 'package:flutter_try/pages/UserAccount.dart';
import 'package:flutter_try/pages/account.dart';
import 'package:flutter_try/providers/user_provider.dart';
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
                SizedBox(height: 20,),
                Positioned(
                  left: 0,
                  right: 0,


                  child: Container(
                      child: Row(
                        children: [
                          IconButton(onPressed: () {
                             Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Account()));
                          },
                              icon: Icon(Icons.arrow_back),
                              color: Color.fromARGB(235, 216, 171, 82),


                          ),
                          SizedBox(width: 20),
                          Text("My Account",
                            style: TextStyle(
                              color: Color.fromARGB(235, 216, 171, 82),
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Schyler-Regular',



                            ),)

                        ],
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Positioned(
                  left:0,
                  right:0,

                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3,color: Color.fromARGB(235, 216, 171, 82),),
                      borderRadius: BorderRadius.circular(25),


                      image: DecorationImage(

                        image: NetworkImage("https://i.pinimg.com/564x/82/e1/e1/82e1e19d04bafb69b9251ca5419d2e59.jpg"),
                        fit: BoxFit.cover,


                      ),

                    ),

                  ),

                ),

                SizedBox(height: 30,),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),
                    child:
                      MaterialButton(
                    // padding: const EdgeInsets.symmetric(horizontal: 40),
                  minWidth: double.minPositive,
                  height: 60,

                  onPressed: () {
                    print('info btn Pressed');
                    Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => UserAccount()));
                  } ,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromARGB(235, 216, 171, 82),
                      width: 3),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  color: Colors.white,
child:Row(
    children: [
      Icon(Icons.account_circle_outlined,color:Color.fromARGB(235, 216, 171, 82),size: 25,),
                  const Text(
                    '\t\t\tAccount',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(235, 216, 171, 82),
                      fontSize: 25,
                      fontWeight: FontWeight.normal,


                    ),

                  )
                    ]    //TextButton.icon(onPressed: (){}, icon: Icons.account_circle_outlined, label: "");
                )
                    ),

                    ),

                SizedBox(height: 10,),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 50/2),
                    child: MaterialButton(

                      minWidth: double.infinity,
                      height: 60,
                      onPressed: (){
                        print('info btn Pressed');
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => allbooking()));
                      } ,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(235, 216, 171, 82),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        Icon(Icons.girl,color:Color.fromARGB(235, 216, 171, 82),),
                       const Text(

                        '\t\t\tWedding Date',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(235, 216, 171, 82),
                          fontSize: 25,
                          fontWeight: FontWeight.normal,


                        ),
                      ),

]
                )
                ),),
                SizedBox(height: 10,width: 40,),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),
                    child: MaterialButton(

                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () => print('info btn Pressed'),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(235, 216, 171, 82),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        Icon(Icons.notifications_outlined,color:Color.fromARGB(235, 216, 171, 82),size: 25,),
                       const Text(
                        '\t\t\tNotification',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(235, 216, 171, 82),
                          fontSize: 25,
                          fontWeight: FontWeight.normal,


                        ),
                       ),

                        ]
                      )
                    ),),
                SizedBox(height: 10,),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),

                    child: MaterialButton(

                      minWidth:double.minPositive,
                      height: 60,

                      onPressed: () => print('info btn Pressed'),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(235, 216, 171, 82),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                        child:Row(
                            children: [
                              Icon(Icons.favorite_border,color:Color.fromARGB(235, 216, 171, 82),size: 25,),

                        const Text(
                         '\t\t\t My favorites',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(235, 216, 171, 82),
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Schyler-Regular',


                          ),
                        ),

                        ]
                    )
                ),),
                SizedBox(height: 10,),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),
                    child: MaterialButton(

                      minWidth: double.minPositive,
                      height: 60,
                      onPressed: () => print('info btn Pressed'),

                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(235, 216, 171, 82),
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
                              icon: Icon(Icons.dangerous_outlined,color: Color.fromARGB(235, 216, 171, 82),),
                            ),
                       const Text(
                        '\t\t\tLog Out',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(235, 216, 171, 82),
                          fontSize: 25,
                          fontWeight: FontWeight.normal,

                        ),
                       ),

                        ]
                      )
                    ),),
                SizedBox(height: 10,width: 20),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50/2),
                    child: MaterialButton(

                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () => print('info btn Pressed'),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(235, 216, 171, 82),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        Icon(Icons.phone_iphone_outlined,color:Color.fromARGB(235, 216, 171, 82),size: 25,),
                    const Text(
                        '\t\t\tAbout us',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(235, 216, 171, 82),
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