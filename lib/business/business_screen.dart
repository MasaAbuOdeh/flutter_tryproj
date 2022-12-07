import 'package:flutter/material.dart';
import 'package:flutter_try/business/business_edit.dart';
import 'package:flutter_try/business/business_home.dart';
import 'package:flutter_try/business/business_profile.dart';
import 'package:flutter_try/fire/createaccount.dart';
import 'package:flutter_try/fire/search.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:provider/provider.dart';

import '../constants/global_variables.dart';
import '../providers/worker_provider.dart';

class business_screen extends StatefulWidget { 
  const business_screen({
    Key? key
  }) :super (key:key);
  @override
  _business_screenState createState()=> _business_screenState();
}
class _business_screenState extends State<business_screen>{
  get svgPicture => null;
  int currentIndex=0;
void onTap(int index){
  setState(() {
    currentIndex=index;
  });
 
  
}


List pages=[
  //home_page(),
business_home(),
// CreateAccount(),
search(),
 business_edit()
];


  @override
  Widget build(BuildContext context) {
    final worker = Provider.of<WorkerProvider>(context).worker;
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
        return Scaffold(
          appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
            
             image: DecorationImage(
            image: NetworkImage("https://i.pinimg.com/564x/ec/d4/97/ecd4974ed81d210fb5aa6ac4ad01ab7a.jpg"), fit: BoxFit.cover)
              
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.network(
                  'https://cdn5.vectorstock.com/i/1000x1000/39/44/abstract-outline-color-of-a-young-elegant-bride-vector-9743944.jpg',
                  width: 120,
                  height: 45,
                  color: Colors.transparent,
                ),
              ),
               Text(
                worker.name,
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 116, 116),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
          body:pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTap,
            currentIndex: currentIndex,
            selectedItemColor: Colors.black54,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            showUnselectedLabels: false,
            showSelectedLabels: true,
            elevation: 0,
            
            items: [
              BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps)),
              BottomNavigationBarItem(label:"chats",icon: Icon(Icons.chat_outlined)),
              BottomNavigationBarItem(label:"Profile",icon: Icon(Icons.person)),
            ]),
          
         /* bottomNavigationBar: Container(
            
            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                bottomNavItem(svgScr: "https://t3.ftcdn.net/jpg/03/66/63/52/240_F_366635299_S1MlOWCcUVFPwgtxznb89r56tvyBBBVU.jpg", 
                title: "Home",
                 press: (){},
                  isActiv: true),
                  bottomNavItem(svgScr: "https://t3.ftcdn.net/jpg/02/59/39/46/240_F_259394679_GGA8JJAEkukYJL9XXFH2JoC3nMguBPNH.jpg", 
                title: "profile",
                 press: (){},
                  isActiv: false),
                  bottomNavItem(svgScr: "https://cdn-icons-png.flaticon.com/128/2961/2961957.png", 
                title: "Recomanded",
                 press: (){},
                  isActiv: false)
                
              ]),
          ),*/
          
          
        );
}
}