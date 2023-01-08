
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_try/business/calendar_nofire/calendar.dart';
import 'package:flutter_try/business/calendar_nofire/calendar_client.dart';
import 'package:flutter_try/common/widgets/stars.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/constants/utils.dart';
import 'package:flutter_try/fire/ChatRoom.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/pages/Wedding_halls.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/businessDetail_services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget{
  static const String routeName ='halls-details';
  //final String worker;
  const DetailPage({
    Key? key,
    }):super(key:key);
@override
  _DetailPageState createState()=> _DetailPageState();


}
class _DetailPageState extends State<DetailPage>with WidgetsBindingObserver{
int gottenStars=4;
 final _buildFormKey = GlobalKey<FormState>();
final businessDetail_services details = businessDetail_services();
var business;
double avgRating = 0;
  double myRating = 0;

  //final FirebaseAuth _auth = FirebaseAuth.instance;
//final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//Map<String, dynamic>? userMap;
  //bool isLoading = false;

  //final TextEditingController _search = TextEditingController();
Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
    
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }


 String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });
if(await _firestore
        .collection('users')
        .where("name", isEqualTo: _search.text)
        .get()!=RangeError){
await _firestore
        .collection('users')
        .where("name", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }
  else {print("no user with this email");}

        }

Future refresh()async{
  final workerProvider = Provider.of<WorkerProvider>(context, listen: false);
 Worker? worker =ModalRoute.of(context)!.settings.arguments as Worker?;
 final wo = Provider.of<WorkerProvider>(context).worker;
 //return worker!.comment;
 String name=worker!.name;
 final userProvider = Provider.of<UserProvider>(context, listen: false);
  List <Worker> workerhallss =[];
  try {
          http.Response res = await http.get(Uri.parse('$uri/business/searchh/$name'), headers:{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
          }
          ) ;   
                      var resposebody=jsonDecode(res.body);
                    // print(resposebody);
                     return resposebody;
                      
                      
          
  } catch (e) {
              showSnackBar(context, e.toString());
  }

}

  Widget build(BuildContext context){
    
   // Key:_buildFormKey;
    final Worker? worker =ModalRoute.of(context)!.settings.arguments as Worker?;
      double totalRating = 0;
      final user = Provider.of<UserProvider>(context).user;
    for (int i = 0; i < worker!.rating!.length; i++) {
      totalRating += worker.rating![i].rating;
      if (worker.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = worker.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / worker.rating!.length;
    }
    
    
      //business=worker;
    
    
    return Scaffold(
       appBar: AppBar(
        title: Text("Detail Page"),
        backgroundColor: Color.fromARGB(235, 216, 171, 82),
      ),
       

      body:worker!.rating!.isNotEmpty? FutureBuilder(future: refresh(),builder: (context, snapshot) {
      if(snapshot.hasData){
        print(snapshot.data[0]['ratings'][0]['rating']);

        

        for (int i = 0; i < snapshot.data[0]['ratings'].length; i++) {
    //  totalRating += snapshot.data[0]['ratings']![i]['rating'];
      /*if (snapshot.data[0]['ratings']![i]['userId'] ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
            print(snapshot.data[0]['ratings'][i]['rating']);
            print(snapshot.data[0]['ratings'][i]['userId']);
       // myRating =double.parse( snapshot.data[0]['ratings'][i]['rating']);
      }*/
      if (worker!.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = worker.rating![i].rating;
      }
    }

   // if (totalRating != 0) {
    //  avgRating = totalRating / worker.rating!.length;
    //}

        return Container(
        width: double.maxFinite,
        height: double.maxFinite,
child :RefreshIndicator(child: Stack(
          
children: [
Positioned(
    left:0,
    right:0,

    child: Container(

      width: double.maxFinite,
      height: 340,

      
      child: Container(
        child:Column(children: [
           CarouselSlider(
        
              items: worker!.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.cover,
                      width:double.maxFinite,
                      height: 150,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
              
            ),

            SizedBox(height: 10,),
                           Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(worker!.images.length, (indexDots) {
                          return Container(
                           
                            padding: const EdgeInsets.only(bottom:2,top:3,right: 2,left:0),
                            margin: const EdgeInsets.only(bottom:2,top:8,right: 2,left:5),
                            height: 8,
                            width: 2==indexDots?30:20,
                            
                            decoration: BoxDecoration(
                              
                              
                              borderRadius: BorderRadius.circular(3),
                              color: 2==indexDots?Colors.black38:Colors.black38?.withOpacity(0.2)
                            ),
                          );
                        }),
                      )
          
        ],
        ),
       
            
      ),
      






      ),
    ),
///////////////////////////////////////////////
  
  Positioned(
      left:10,
      top:30,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon:Icon(Icons.menu), color:Colors.white



          )
        ],
      )),
  Positioned(
      top:340,
      child: Container(
padding: const EdgeInsets.only(left: 20,right: 20,top: 30) ,
    width: MediaQuery.of(context).size.width,
        height: 500,
decoration: BoxDecoration(
    color:Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
topRight: Radius.circular(50),
  )
),
child: Column(
  children: [
    Row(
      children: [
        Stars(rating: avgRating,),
        SizedBox(width: 10,),
        Text("Avareg Rating")
      ],
    ),
  
      // Stars(rating: 4.0,),
      
    
    SizedBox(height: 10,),
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          worker!.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.normal

          ),
        ),
        Text(
          '\$${worker.price}',
          style: TextStyle(
              color: Colors.black26,
              fontSize: 25,
              fontWeight: FontWeight.bold

          ),
        ),
         
        //AppLargeText(text:"Nadi Al-Madina",color:Colors.black),
        //AppLargeText(text:"\$ 20000"),
      ],
    ),
    SizedBox(height: 10,),
    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/location',arguments: worker);Colors.red[200];},

                          child: Row(
      children: [
        Icon(Icons.location_on,color: Colors.black45,),
        SizedBox(width: 5,),
         Text(
         worker!.location ,
          style: TextStyle(
              color: Colors.black45,
              fontSize: 20,
              fontWeight: FontWeight.normal

          ),
        ),
        SizedBox(width: 160,),
        Text('  phone : ${worker.phone}'),

      ],

    ),
                          //print(recomend![index].name+'pressed');},
                          ),
    
    SizedBox(height: 10,),
    
    Row(children: [
      GestureDetector(onTap: () {
      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailPage()));
    },
    child: RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              onRatingUpdate: (rating) {
                details.rateProduct(
                  context: context,
                  worker: worker,
                  rating: rating,
                );
              },
            ),
    
    ),
    SizedBox(width: 10,),
      GestureDetector(
      child: MaterialButton(
      minWidth: 35,
      height: 35 ,
      onPressed: () {print( 'rate Pressed');
      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => hallsPage()));},
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black),
          borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: const Text(
        'save rate',
        style: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
      onTap: () {
         
      },
      ),
     
    ],),
    SizedBox(height: 10,),

     Text(
      worker.discreption,
      style: TextStyle(

          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.normal

      ),
    ),

        SizedBox(height: 10,),

         Container(child:
              MaterialButton(
                minWidth: double.infinity,
                height: 40 ,
                onPressed: () async {print( 'chat btn Pressed');

      FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });
if(await _firestore
        .collection('users')
        .where("name", isEqualTo: worker!.name)
        .get()!=RangeError){
await _firestore
        .collection('users')
        .where("name", isEqualTo: worker!.name)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }
  else {print("no user with this email");}

  print(userMap);
 // print(_auth.currentUser);
                          String roomId = chatRoomId(
                             _auth.currentUser!.displayName!,
                              userMap!['name']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              ),
                            ),
                          );
                          print(roomId);

     /* FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

     _firestore
        .collection('users')
        .where("email", isEqualTo: worker.email)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    }); ;
                          String roomId = chatRoomId(
                              _auth.currentUser!.displayName!,
                              userMap!['name']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              ),
                            ),
                          );*/

        
        //Navigator.of(context).pushNamed('/searchh',);Colors.red[200];
},
                shape:RoundedRectangleBorder(
                    side: const BorderSide(
                        color:Colors.black),
                    borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.white,
                child: const Text(
                  'Chat',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )

  ),

    SizedBox(height: 5,),

    Container(child:
    MaterialButton(
      minWidth: double.infinity,
      height: 40 ,
      onPressed: () {print( 'comment btn Pressed');
      Navigator.of(context).pushNamed('/comment',arguments: worker);Colors.red[200];
                          print(worker.name+'pressed') ;},
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black),
          borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.white,
      child: const Text(
        'Show comments',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    )

    ),

    SizedBox(height: 5,),

    Container(child:
    MaterialButton(
      minWidth: double.infinity,
      height: 40 ,
      onPressed: () {
        Navigator.of(context).pushNamed('/booking',arguments: worker);Colors.red[200];
                          print(worker.name+'pressed') ;
        print( 'booking btn Pressed');
       /* Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Calendar_client(),
                            ),
                            
                          );*/

      } ,
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black
            ),
          borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.white,
      child: const Text(
        'Booking',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    )

    ),








    ]
      )
  )
  ),
],
        ), onRefresh: refresh)
         

      );
      }
      return CircularProgressIndicator();
      },):Container(
         width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          
children: [
Positioned(
    left:0,
    right:0,

    child: Container(

      width: double.maxFinite,
      height: 340,

      
      child: Container(
        child:Column(children: [
           CarouselSlider(
        
              items: worker!.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.cover,
                      width:double.maxFinite,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
              
            ),

            SizedBox(height: 10,),
                           Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(worker!.images.length, (indexDots) {
                          return Container(
                           
                            padding: const EdgeInsets.only(bottom:2,top:3,right: 2,left:0),
                            margin: const EdgeInsets.only(bottom:2,top:8,right: 2,left:5),
                            height: 8,
                            width: 2==indexDots?30:20,
                            
                            decoration: BoxDecoration(
                              
                              
                              borderRadius: BorderRadius.circular(3),
                              color: 2==indexDots?Colors.black38:Colors.black38?.withOpacity(0.2)
                            ),
                          );
                        }),
                      )
          
        ],
        ),
       
            
      ),
      






      ),
    ),
///////////////////////////////////////////////
  
  Positioned(
      left:10,
      top:30,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon:Icon(Icons.menu), color:Colors.white



          )
        ],
      )),
  Positioned(
      top:340,
      child: Container(
padding: const EdgeInsets.only(left: 20,right: 20,top: 30) ,
    width: MediaQuery.of(context).size.width,
        height: 500,
decoration: BoxDecoration(
    color:Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
topRight: Radius.circular(50),
  )
),
child: Column(
  children: [
    Row(
      children: [
        Stars(rating: avgRating,),
        SizedBox(width: 10,),
        Text("Avareg Rating")
      ],
    ),
  
      // Stars(rating: 4.0,),
      
    
    SizedBox(height: 10,),
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          worker!.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.normal

          ),
        ),
        Text(
          '\$${worker.price}',
          style: TextStyle(
              color: Colors.black26,
              fontSize: 25,
              fontWeight: FontWeight.bold

          ),
        ),
         
        //AppLargeText(text:"Nadi Al-Madina",color:Colors.black),
        //AppLargeText(text:"\$ 20000"),
      ],
    ),
    SizedBox(height: 10,),
    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/location',arguments: worker);Colors.red[200];},

                          child: Row(
      children: [
        Icon(Icons.location_on,color: Colors.black45,),
        SizedBox(width: 5,),
         Text(
         worker!.location ,
          style: TextStyle(
              color: Colors.black45,
              fontSize: 20,
              fontWeight: FontWeight.normal

          ),
        ),
        SizedBox(width: 160,),
        Text('  phone : ${worker.phone}'),

      ],

    ),
                          //print(recomend![index].name+'pressed');},
                          ),
    
    SizedBox(height: 10,),
    
    Row(children: [
      GestureDetector(onTap: () {
      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailPage()));
    },
    child: RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              onRatingUpdate: (rating) {
                details.rateProduct(
                  context: context,
                  worker: worker,
                  rating: rating,
                );
              },
            ),
    
    ),
    SizedBox(width: 10,),
      GestureDetector(
      child: MaterialButton(
      minWidth: 35,
      height: 35 ,
      onPressed: () {print( 'rate Pressed');
      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => hallsPage()));},
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black),
          borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: const Text(
        'save rate',
        style: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
      onTap: () {
         
      },
      ),
     
    ],),
    SizedBox(height: 15,),

     Text(
      worker.discreption,
      style: TextStyle(

          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.normal

      ),
    ),

        SizedBox(height: 10,),

         Container(child:
              MaterialButton(
                minWidth: double.infinity,
                height: 40 ,
                onPressed: () async {print( 'chat btn Pressed');

      FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });
if(await _firestore
        .collection('users')
        .where("name", isEqualTo: worker!.name)
        .get()!=RangeError){
await _firestore
        .collection('users')
        .where("name", isEqualTo: worker!.name)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }
  else {print("no user with this email");}

  print(userMap);
 // print(_auth.currentUser);
                          String roomId = chatRoomId(
                             _auth.currentUser!.displayName!,
                              userMap!['name']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              ),
                            ),
                          );
                          print(roomId);

     /* FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

     _firestore
        .collection('users')
        .where("email", isEqualTo: worker.email)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    }); ;
                          String roomId = chatRoomId(
                              _auth.currentUser!.displayName!,
                              userMap!['name']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              ),
                            ),
                          );*/

        
        //Navigator.of(context).pushNamed('/searchh',);Colors.red[200];
},
                shape:RoundedRectangleBorder(
                    side: const BorderSide(
                        color:Colors.black),
                    borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.white,
                child: const Text(
                  'Chat',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )

  ),

    SizedBox(height: 5,),

    Container(child:
    MaterialButton(
      minWidth: double.infinity,
      height: 40 ,
      onPressed: () {print( 'comment btn Pressed');
      Navigator.of(context).pushNamed('/comment',arguments: worker);Colors.red[200];
                          print(worker.name+'pressed') ;},
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black),
          borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.white,
      child: const Text(
        'Show comments',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    )

    ),

    SizedBox(height: 5,),

    Container(child:
    MaterialButton(
      minWidth: double.infinity,
      height: 40 ,
      onPressed: () {
        Navigator.of(context).pushNamed('/booking',arguments: worker);Colors.red[200];
                          print(worker.name+'pressed') ;
        print( 'booking btn Pressed');
       /* Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Calendar_client(),
                            ),
                            
                          );*/

      } ,
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black
            ),
          borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.white,
      child: const Text(
        'Booking',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    )

    ),








    ]
      )
  )
  ),
],
        ),
      )
    );
  }
}