import 'package:flutter/material.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/businessDetail_services.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:provider/provider.dart';

class allbooking extends StatefulWidget{
const allbooking({Key? key}):super(key:key);
  get users => null;
  
  get workers => null;
  get recomend=> null;
 // get temp =>null;
  //get workerdata => null;
@override
_allbookingState createState()=> _allbookingState();


}
class _allbookingState extends State<allbooking> with TickerProviderStateMixin {
  final WorkerAuthService getall = WorkerAuthService();
  List<Worker>?allworkers;
  List<Worker>? Myworkers;
  Future gettallworkers()async{
    allworkers=await getall.showAll(context);
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettallworkers();
  }
  
  @override
  Widget build(BuildContext context) {
    final worker = Provider.of<WorkerProvider>(context).worker;
    for(int i=0;i<allworkers!.length;i++){
if(allworkers![i].order![i].userId==Provider.of<UserProvider>(context, listen: false).user.id){
  Myworkers![i]=allworkers![i];
}
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Color.fromARGB(235, 216, 171, 82),
      ) ,
      body:Myworkers!=null? ListView.builder(

                
                 itemCount:Myworkers!.length,
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

        return  Container(
          width:double.maxFinite,
          height: 260,
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
                  Text('My order :${Myworkers![index].name}', style: TextStyle(fontSize: 20),),
                 // SizedBox(width: 15,),
                  //Text(worker.order![index].userId, style: TextStyle(fontSize: 10),),

                ],
              ),
              SizedBox(height: 10,),
              Text('booking date:${Myworkers![index].order![index].date}', style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('from:${Myworkers![index].order![index].from}', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 15,),
                  Text('to:${Myworkers![index].order![index].to}', style: TextStyle(fontSize: 20),),
                ],
              ),
              SizedBox(height: 15,),
              Text('Phone number:${Myworkers![index].order![index].userphone}', style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text('status: ${Myworkers![index].order![index].status}', style: TextStyle(fontSize: 20),),

                ],
              ),
            
          
   
            ],
          ),
          );
        
        
      
    

                
  }):Text(''),
               
    );
  }


}