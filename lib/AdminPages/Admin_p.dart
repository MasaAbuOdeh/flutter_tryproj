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

              

             // SizedBox(height:70,),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
                  

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     // SizedBox(height: 100,),
                     
                    
                     //SizedBox(height: 60,),
                      
                      Expanded(
                        child: GridView.count(
                          crossAxisCount:1,
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          
                          
                          children: <Widget>[
                            
                            Categoryard(
                              
                              title:"Client",
                              svgSrc: "https://i.pinimg.com/564x/b2/eb/9b/b2eb9b687383fddb6fba5dce063a6f03.jpg",
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