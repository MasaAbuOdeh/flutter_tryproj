import 'package:flutter/material.dart';
import 'package:flutter_try/models/worker.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final String data;
  const SingleProduct({
    Key? key,
    required this.image,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('Detail',arguments: Worker);Colors.red[200];
                          print(data+'pressed');
                          
                        },
     // mainAxisSize: MainAxisSize.max,
      //padding: const EdgeInsets.symmetric(horizontal: 5),
      //child: Column(

        child: Column(
          
          
          children: [
          
          
         Container(
        
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
          alignment: Alignment.topCenter,
          width: 250,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: 250,
            
            
          ),
          
          
          
        ),
      
      
      Container(
        alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 10,
                                right: 15,
                              ),
                              child: Text(
                                data,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
      )
        ],
        ),
        
      ) 
    ;
  }
}