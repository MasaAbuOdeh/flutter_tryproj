import 'package:flutter/material.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/auth_service.dart';
import 'package:flutter_try/services/businessDetail_services.dart';
import 'package:provider/provider.dart';

class business_bookreq extends StatefulWidget{
const business_bookreq({Key? key}):super(key:key);
  get users => null;
  
  get workers => null;
  get recomend=> null;
 // get temp =>null;
  //get workerdata => null;
@override
_business_bookreqState createState()=> _business_bookreqState();


}
class _business_bookreqState extends State<business_bookreq> with TickerProviderStateMixin {
  final businessDetail_services orderdetail = businessDetail_services();
  final AuthService notinfo =AuthService();
  List<Worker>?workers;
  Future refresh()async{
    
  }
  
  @override
  Widget build(BuildContext context) {
    final worker = Provider.of<WorkerProvider>(context).worker;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking request'),
        backgroundColor: Color.fromARGB(235, 216, 171, 82),
      ) ,
      body:worker.order!=null? ListView.builder(

                
                 itemCount:worker.order!.length,
                 scrollDirection: Axis.vertical,
                 itemBuilder: (BuildContext context, int index) {
                // final workersdata=workers![index];
   // for (int l = 0; l < workers![i]!.rating!.length; l++) {
    //  totalRating += workers![i].rating![l].rating;}
   //   if(totalRating!=0){
    //    avrgi=totalRating/workers![i]!.rating!.length;
     // }
           
     
         //for(int j=i+1; j<workers!.length;j++ ){
         // int i=index;

      

                  
                
           
                 // final workerdata1 = workers![index];
                
                 
     // mainAxisSize: MainAxisSize.max,
      //padding: const EdgeInsets.symmetric(horizontal: 5),
      //child: Column(

        return worker.order![index].status=='reject'?Text(''): Container(
          width:double.maxFinite,
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.only(right: 17, top: 20,left: 17),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 20,
                spreadRadius: 5
              )
            ]
          ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              SizedBox(height: 10,),
              
              //Text(workerdata.name, style: TextStyle(fontSize: 35),),
              //SizedBox(height: 5,),
              Row(
                children: [
                  Text('Event:${worker.order![index].eventname}', style: TextStyle(fontSize: 20),),
                   SizedBox(width: 15,),
                 

                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('Client:${worker.order![index].username}', style: TextStyle(fontSize: 15),),
                  SizedBox(width: 10,),
                  Text(worker.order![index].userId, style: TextStyle(fontSize: 10),),

                ],
              ),
              SizedBox(height: 10,),
              Text('booking date:${worker.order![index].date}', style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('from:${worker.order![index].from}', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 15,),
                  Text('to:${worker.order![index].to}', style: TextStyle(fontSize: 20),),
                ],
              ),
              SizedBox(height: 15,),
              Text('Phone number:${worker.order![index].userphone}', style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text('status: ${worker.order![index].status}', style: TextStyle(fontSize: 20),),

                ],
              ),
            
    SizedBox(width: 20,),
    Row(
      children: [
         MaterialButton(
      minWidth: 35,
      height: 35 ,
      onPressed: () {print( 'accept Pressed');
      orderdetail.orderbusiness(context: context,
       worker: worker,
        date: worker.order![index].date,
        eventname:worker.order![index].eventname ,
        from:  worker.order![index].from,
         to:  worker.order![index].to,
          username:  worker.order![index].username,
           userphone:  worker.order![index].userphone,
            status: 'accept');
            notinfo.sendNoti(context: context, name: worker.order![index].username,
             Notititle: worker.name,
              Notibody: 'Your booking request accepted');
            

      },
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black),
          borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: const Text(
        'accept',
        style: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    SizedBox(width: 15,),
         MaterialButton(
      minWidth: 35,
      height: 35 ,
      onPressed: () {print( 'reject Pressed');
      orderdetail.orderbusiness(context: context,
       worker: worker,
        date: worker.order![index].date,
        eventname: worker.order![index].eventname,
        from:  worker.order![index].from,
         to:  worker.order![index].to,
          username:  worker.order![index].username,
           userphone:  worker.order![index].userphone,
            status: 'reject');
      },
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black),
          borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: const Text(
        'reject',
        style: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    SizedBox(width: 15,),
    MaterialButton(
      minWidth: 35,
      height: 35 ,
      onPressed: () {print( 'accept Pressed');

      orderdetail.orderbusiness(context: context,
       worker: worker,
        date: worker.order![index].date,
        eventname: worker.order![index].eventname,
        from:  worker.order![index].from,
         to:  worker.order![index].to,
          username:  worker.order![index].username,
           userphone:  worker.order![index].userphone,
            status: 'InProgress');
      },
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black),
          borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: const Text(
        'InProgress',
        style: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
      ],

    ),
   
            ],
          ),
          );
        
        
      
    

                
  }):Text(''),
               
    );
  }


}