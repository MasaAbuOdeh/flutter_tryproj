import 'package:flutter/material.dart';
import 'package:flutter_try/pages/HLprice.dart';
import 'package:flutter_try/pages/LHprice.dart';
import 'package:flutter_try/pages/Nablushalls.dart';
import 'package:flutter_try/pages/Tulkaremhalls.dart';
import 'package:flutter_try/widget/Categoryard.dart';
class Admi_p extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
        return Scaffold(
          body: Stack(
            children:<Widget> [

              Container(
                height: size.height*0.40,
                width:double.maxFinite,
                decoration: BoxDecoration(
                 // color: Colors.red[100],
                  image: DecorationImage(
                    //alignment: Alignment.centerLeft,
                    image: NetworkImage("https://i.pinimg.com/564x/2b/9a/a2/2b9aa2832b5d11a17c0b704d8dd19e16.jpg"),
                    
                  )
                ),
              ),

              SizedBox(height:70,),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
                  

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 100,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 231, 175, 181).withOpacity(0.2),
                            shape: BoxShape.circle,

                          ),
                          child: 
                                IconButton(onPressed: (){}, icon:Icon(Icons.menu), color:Colors.black )
                        ),
                      ),
                    
                     SizedBox(height: 60,),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29.5),
                        ),
                        child: TextField(
                          //onFieldSubmitted:navegatetosearchscreen, 
                          decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14,),
                prefixIcon: Icon(
                    Icons. search,
                    color: Colors.black38,
                    size: 35,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.black38,
                    

                )
            ),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount:2,
                          childAspectRatio: 0.88,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          
                          
                          children: <Widget>[
                            Categoryard(
                              
                              title:"Client",
                              svgSrc: "https://i.pinimg.com/564x/ff/29/9b/ff299bf780591230a84feab495527e66.jpg",
                              printt:'clientA',
                            ),
                              Categoryard(
                              title:"business",
                              svgSrc: "https://i.pinimg.com/564x/e1/8d/eb/e18deb2b7ceec7de1de1c3adf3e4fcbf.jpg",
                              printt:'businessA',
                            ),
                          ], ) ,
                      )
                    ],
                  ), ),
              )
            ],
          ),
        );
  }
}