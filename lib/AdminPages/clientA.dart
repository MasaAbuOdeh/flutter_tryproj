import 'package:flutter/material.dart';
import 'package:flutter_try/models/user.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/services/auth_service.dart';
import 'package:flutter_try/services/business_info.dart';
import 'package:flutter_try/widget/loader.dart';
import 'package:get/get.dart';

class clientA extends StatefulWidget{
const clientA({Key? key}):super(key:key);
  get users => null;
  
  get workers => null;
  get recomend=> null;
 // get temp =>null;
  //get workerdata => null;
@override
_clientAState createState()=> _clientAState();


}
class _clientAState extends State<clientA> with TickerProviderStateMixin {
  List <User> ? users ;
  final AuthService hall = AuthService();
  final business_info activatee =business_info();
  //late Worker temp;
  //late Worker workersdata;

  showallusers() async{
    
    users = await hall.showAlluser(context);
    

    setState(() {
      
    });
  
  } 

  
       
  

  void initState() {
    // TODO: implement initState
    super.initState();
    showallusers();
     
    
  
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   TabController _tabController = TabController(length: 1, vsync: this);
    return users == null
        ? const Loader()
        : Scaffold(
          appBar: AppBar(title: Text('All clients'),backgroundColor:Color.fromARGB(235, 216, 171, 82) ,),
      body: Container(
        height: MediaQuery.of(context).size.height*0.75,
        child: ListView.builder(itemCount: users!.length,itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
              title: Text(users![index].name,style: TextStyle(fontSize: 22),),
              subtitle: Text(users![index].email,style: TextStyle(fontSize: 18),),
              trailing:  IconButton(
                              onPressed: () {
                                activatee.useractivate(context: context, name: users![index].name, statu: 'activate');

                               // closee.logout(context);
                              },
                              icon: Icon(Icons.delete_forever_rounded,color: Color.fromARGB(235, 216, 171, 82),),
                            ), 
            ),
          );
        }),
      ),
        ); 
  }

}