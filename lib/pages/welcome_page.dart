import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_try/widget/ResponsiveButton.dart';
import 'package:flutter_try/widget/app_large_text.dart';
import 'package:flutter_try/widget/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
   List images =[
    "https://i.pinimg.com/564x/56/19/cd/5619cde7bd9438c230fe98999cd20d0a.jpg?fbclid=IwAR2D8DV4YWWvs-UCxTpmNXTpAPPjR4b0KzkXaDHOat7niuiq4pCPm8BpjqE",
    "https://i.pinimg.com/564x/17/ea/6c/17ea6c1fdb68b68afbaa8c7b7528fa85.jpg"
   ];

   List textss =[
    "Client",
    "Businuess",
   ];
   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (_,index){
          return Container(
            width:double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:NetworkImage(
                  ""+images[index]
                ), fit:BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(top: 500, left: 20, right: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 10,),
                          AppLargeText(text:index==0? "Dream Wedding":""),
                          //AppText(text:index==0? "":""),
                          AppText(text:index==0? "    Wedding planning made\n    Joyful and easy":"", size:20),
                          
                         // AppText(text:index==0? "Joyful and easy":"", size:20),
                          SizedBox(height: 160,),
                           Row(
                               
                        
                        
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(2, (indexDots) {
                          return Container(
                           
                            padding: const EdgeInsets.only(bottom:2,top:3,right: 2,left:0),
                            margin: const EdgeInsets.only(bottom:2,top:8,right: 2,left:5),
                            height: 8,
                            width: index==indexDots?100:60,
                            
                            decoration: BoxDecoration(
                              
                              
                              borderRadius: BorderRadius.circular(5),
                              color: index==indexDots?Colors.black38:Colors.black38?.withOpacity(0.2)
                            ),
                          );
                        }),
                      )
                           
                           
                        ],
                      ),
                      Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 5,
                          width:100,
                          ),
                          
                          
                            
                               ResponsiveButton(
                            text: index==1? "Admin":"",
                            width:index==1? 150:0,
                            butttext: 'Admin',
                           /* press: (){Navigator.of(context).pushNamed('login');}*/),
                          
SizedBox(height: 30,
                          
                          ),
                          
                          
                          /*Container(
                            width: 250,
                            child: AppText(
                              text:"We help you save time and effort by collecting all the details you need for your wedding in one place" ),
                              color: Colors.red[300],
                            
                          )*/
                          
                          
                          ResponsiveButton(
                            text:index==1?'Buisnuiss':"",
                            width:index==1? 150:0,
                            butttext: 'Buisnuiss',
                           /* press: (){Navigator.of(context).pushNamed('login');}*/),
                           SizedBox(height: 0,),
                           SizedBox(height: 30,
                          width:50,
                          ),
                          Container(
                            margin:EdgeInsets.only(left:5) ,

                           child :ResponsiveButton(
                            text:index==1? ""+textss[0]:"",
                            width:index==1? 150:0,
                            butttext: 'Client',
                           /* press: (){Navigator.of(context).pushNamed('login');}*/),
                          ),
                        ]
                      )
                    ]),
                ),
                
          );
        },
      ),
    );
  }
}