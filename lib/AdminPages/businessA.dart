import 'package:flutter/material.dart';
import 'package:flutter_try/models/user.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/services/auth_service.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:flutter_try/widget/loader.dart';


class businessA extends StatefulWidget{
const businessA({Key? key}):super(key:key);
  get users => null;
  
  get workers => null;
  get recomend=> null;
 // get temp =>null;
  //get workerdata => null;
@override
_businessAState createState()=> _businessAState();


}
class _businessAState extends State<businessA> with TickerProviderStateMixin {
  List <User> ? users ;
  List <Worker> ?workers;
  final WorkerAuthService allworkers=WorkerAuthService();
  //late Worker temp;
  //late Worker workersdata;

  showallworkers() async{
    
    workers = await allworkers.allworkers(context);
    

    setState(() {
      
    });
  
  } 

  
       
  

  void initState() {
    // TODO: implement initState
    super.initState();
    showallworkers();
     
    
  
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   TabController _tabController = TabController(length: 1, vsync: this);
    return workers == null
        ? const Loader()
        : Scaffold(
          appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
            
             image: DecorationImage(
            image: NetworkImage("https://i.pinimg.com/564x/ec/d4/97/ecd4974ed81d210fb5aa6ac4ad01ab7a.jpg"), fit: BoxFit.cover)
              
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.network(
                  'https://cdn5.vectorstock.com/i/1000x1000/39/44/abstract-outline-color-of-a-young-elegant-bride-vector-9743944.jpg',
                  width: 120,
                  height: 45,
                  color: Colors.transparent,
                ),
              ), 
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height*0.75,
        child: ListView.builder(itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
              title: Text(workers![index].name,style: TextStyle(fontSize: 22),),
              subtitle: Text(workers![index].email,style: TextStyle(fontSize: 18),),
              trailing:  IconButton(
                              onPressed: () {
                               // closee.logout(context);
                              },
                              icon: Icon(Icons.done_outline_sharp,color: Colors.red[100],),
                            ),
            ),
          );
        }),
      ),
        ); 
  }

}