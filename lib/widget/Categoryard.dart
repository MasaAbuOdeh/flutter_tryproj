
import 'package:flutter/material.dart';

class Categoryard extends StatelessWidget{
  final String svgSrc;
  final String title ;
  final String printt;

  const Categoryard({
    super.key, 
    required this.svgSrc, 
    required this.title,
    required this.printt});
  
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        
        
   // padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
    
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          offset: Offset(0,17),
          blurRadius: 17,
          spreadRadius: -23,
         // color: kElevationToShadow,
        )
      ]
    ),
    child:Material(
      color: Colors.transparent,
      child:InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(printt);Colors.red[200];
        },
        child:Padding(
          padding: const EdgeInsets.all(10),
           child: Column(
      children:<Widget> [
        Spacer(),
        new Image(image: NetworkImage(svgSrc),
        height: 140,
        width: 170,
        fit: BoxFit.cover,),
        //Image(image: NetworkImage(svgSrc)),
        Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),
        )

      ]),
        ),
       
      ),
      ),
    
   ),
    );
   
  }

}