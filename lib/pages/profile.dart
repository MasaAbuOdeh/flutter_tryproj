
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/pages/UserAccount.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget{
  const profile({Key? key}):super(key:key);
  @override
  _profileState createState()=> _profileState();


}
class _profileState extends State<profile>{
  DateTime dateTime=DateTime(2022,22,11,0,0);
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
                          IconButton(onPressed: () {},
                              icon: Icon(Icons.arrow_back),
                              color: Color(0xeeffb7c5)


                          ),
                          SizedBox(width: 20),
                          Text("My Account",
                            style: TextStyle(
                              color: Color(0xeeffb7c5),
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
                      border: Border.all(width: 3,color: Color(0xeeffb7c5)),
                      borderRadius: BorderRadius.circular(25),


                      image: DecorationImage(

                        image: NetworkImage("https://images.unsplash.com/photo-1617785258979-b50ebd43871e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YnJpZGUlMjBhbmQlMjBncm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80"),
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
                          color: Color(0xeeffb7c5),
                      width: 3),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  color: Colors.white,
child:Row(
    children: [
      Icon(Icons.account_circle_outlined,color:Color(0xeeffb7c5),size: 25,),
                  const Text(
                    '\t\t\tAccount',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xeeffb7c5),
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
                      onPressed: () => print('info btn Pressed'),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xeeffb7c5),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        Icon(Icons.girl,color:Color(0xeeffb7c5),size: 25,),
                       const Text(

                        '\t\t\tWedding Date',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xeeffb7c5),
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
                              color: Color(0xeeffb7c5),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        Icon(Icons.notifications_outlined,color:Color(0xeeffb7c5),size: 25,),
                       const Text(
                        '\t\t\tNotification',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xeeffb7c5),
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
                              color: Color(0xeeffb7c5),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                        child:Row(
                            children: [
                              Icon(Icons.favorite_border,color:Color(0xeeffb7c5),size: 25,),

                        const Text(
                         '\t\t\t My favorites',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xeeffb7c5),
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
                              color: Color(0xeeffb7c5),
                            width: 3
                         ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        Icon(Icons.dangerous_outlined,color:Color(0xeeffb7c5),size: 25,),
                       const Text(
                        '\t\t\tDelete Account',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xeeffb7c5),
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
                              color: Color(0xeeffb7c5),
                          width: 3),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.white,
                      child:Row(
                        children: [
                        Icon(Icons.phone_iphone_outlined,color:Color(0xeeffb7c5),size: 25,),
                    const Text(
                        '\t\t\tAbout us',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xeeffb7c5),
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