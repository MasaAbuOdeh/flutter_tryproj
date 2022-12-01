import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:latlong2/latlong.dart';
class maps extends StatefulWidget{
 // static const String routeName ='halls-details';
  //final String worker;
  const maps({
    Key? key,
    }):super(key:key);
@override
  _mapsState createState()=> _mapsState();


}
class _mapsState extends State<maps>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
   final Worker? workerr =ModalRoute.of(context)!.settings.arguments as Worker?;
   return new Scaffold(
    appBar: new AppBar(title: new Text("location"),),
    body: new FlutterMap(options: new MapOptions(
  //center: LatLngBounds(40.71,-74.00),
      minZoom: 10.0,
      center: new LatLng(workerr!.latitude, workerr.longitude),
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
        subdomains: ['a', 'b', 'c'],
        maxZoom: 19,
      ),
      MarkerLayer(
        markers: [
          Marker(point: LatLng(workerr!.latitude, workerr.longitude),
          width: 100.0,
          height: 100.0,
           builder: (context)=>
           Container(
            child: IconButton(onPressed: (){
              showModalBottomSheet(context: context, builder:(builder) {
                return Container(
                  height: 100,
                  color: Colors.white,
                  child: Text(workerr.name,textAlign: TextAlign.center,style: TextStyle(fontSize: 50),),
                );
              });
            }, icon:Icon(Icons.location_on,semanticLabel:workerr.name,), color:Colors.red,iconSize: 45.0,



          )
           ))
        ],
      )
    ],
    
    ),
   );



  }


}