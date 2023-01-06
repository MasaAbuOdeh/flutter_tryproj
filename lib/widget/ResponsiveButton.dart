import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget{
  bool? isResponsive ;
  double? width;
  final String text;
  final String butttext;
 // final Function press;
 //Color color;
  ResponsiveButton({Key? key,
  this.width,
  this.isResponsive,
   // required this.color,
  required this.text,
  required this.butttext
  }): super(key: key);
   
   
   @override 
   Widget build(BuildContext context){
    return Container (
      
      width: width,
      height:50,
     // color: Colors.red[100],
      
      
      child: ClipRRect(
        borderRadius:BorderRadius.circular(20),
        child: ElevatedButton(
          child:  Text(""+text,style: TextStyle(fontSize: 20,color: Colors.black54),) ,
          style: ElevatedButton.styleFrom(primary: Colors.white),
        
          onPressed: (){Navigator.of(context).pushNamed(butttext);Colors.red[200];}),
           ),
           
      
      
      
      
      /*decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red[200]
      ),*/
      
      /*child: Row(
        nmenmainAxisAligt: MainAxisAlignment.center,
        children: [
          Text(text,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          
        ]),*/
       
      

    );
   }


}