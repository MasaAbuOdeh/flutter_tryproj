import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_try/business/calendar_nofire/calendar_client.dart';
import 'package:flutter_try/business/notiboocingreq.dart';
import 'package:flutter_try/pages/home_page.dart';
import 'package:flutter_try/pages/profile.dart';
import 'package:flutter_try/pages/recomanded.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/services/auth_service.dart';
import 'package:flutter_try/services/notification_api.dart';
import 'package:flutter_try/widget/Categoryard.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key
  }) :super (key:key);
  @override
  _HomeScreenState createState()=> _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
   final NotificationApi not = NotificationApi();
   final AuthService notinfo =AuthService();
   
  get svgPicture => null;
  int currentIndex=0;
void onTap(int index){
  setState(() {
    currentIndex=index;
  });
 
  
}
void initState() {
    super.initState();
    NotificationApi.initialize(flutterLocalNotificationsPlugin);
    ListenNotification();
    
  } 
  void ListenNotification()=>
  NotificationApi.onNotifications.stream.listen(onClickNotification);
   void onClickNotification(String? payload)=>
   Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => Calendar_client(payload: payload,),

   ));


List pages=[
  //home_page(),
home_page(),
 //recomended(),
  profile(),
];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //this gonna give us total height and with of our device
    final user = Provider.of<UserProvider>(context).user;
    if(user.Notibody!.compareTo("Your booking request accepted")==0){
       notinfo.sendNoti(context: context,
                                name: user.name, Notititle: '',
                                 Notibody: '');
      NotificationApi.showBigTextNotification(title: user!.Notititle!,
                              body: user!.Notibody!,
                              fln: flutterLocalNotificationsPlugin);
                              print("object");
                              
                               

    }
   /* NotificationApi.showBigTextNotification(title: _nameController.text,
                              body: _emailController.text,
                              fln: flutterLocalNotificationsPlugin);
                              print("object");*/
        return Scaffold(
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
              //BottomNavigationBarItem(label:"Recomended",icon: Icon(Icons.bar_chart_sharp)),
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
  
class bottomNavItem extends StatelessWidget{
  final String svgScr;
  final String title;
  final Function press;
  final bool isActiv;

  const bottomNavItem({super.key,
   required this.svgScr,
    required this.title,
     required this.press,
      required this.isActiv});
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      
     onTap: press(),
     
     child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        
         new Image(image: NetworkImage(svgScr),
        height: 20,
        width: 20,
        fit: BoxFit.cover,),
        Text(title)
      ],
     ),
    );
    throw UnimplementedError();
  }
  
}



