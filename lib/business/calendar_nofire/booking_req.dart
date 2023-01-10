
import 'package:flutter/material.dart';
import 'package:flutter_try/models/order.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/services/businessDetail_services.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:flutter_try/ucan/shared/componets/componets.dart';
//import 'package:flutter_try/ucan/shared/styles/thems.dart';
//import 'package:get/get.dart';
import 'package:provider/provider.dart';
//import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class AddEventScreen extends StatefulWidget{
  const AddEventScreen({Key? key}):super(key:key);

  @override
  _AddEventScreenState createState()=> _AddEventScreenState();


}


 class _AddEventScreenState extends State<AddEventScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  var titlecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var starttimecontroller = TextEditingController();
  var endtimecontroller = TextEditingController();
  var remindcontroller = TextEditingController();
  final businessDetail_services orderdetail = businessDetail_services();
  List<Worker> ? workers;
  List<int> remindList = [5, 10, 15, 20];
  final WorkerAuthService hall = WorkerAuthService();
  

 // TodoLayoutController todocontroller = Get.find<TodoLayoutController>();
 Future showallhalls() async{
    
    workers = await hall.showAllhalls(context);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _buildFromAddTask(context),
    );
  }

  _buildFromAddTask(BuildContext context){
     final Worker? worker =ModalRoute.of(context)!.settings.arguments as Worker?;
    final user = Provider.of<UserProvider>(context).user;
    late Order myorder;
    int flag =0;
    if(worker!.order!=null){
      for(int i=0;i<worker!.order!.length;i++){

        if (worker.order![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myorder = worker.order![i];
        flag=1;
      }
        
      }
      }
     // else myorder=worker.order![0];

   return SingleChildScrollView(
    
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Text(
                'Add Event',
               // style: headerStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultTextFormField(
                          controller: titlecontroller,
                          inputtype: TextInputType.text,
                          ontap: () {},
                          onvalidate: (value) {
                            if (value!.isEmpty) {
                              return "title must not be empty";
                            }
                          },
                          text: "Event Name"),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextFormField(
                          readonly: true,
                          controller: datecontroller,
                          inputtype: TextInputType.datetime,
                          prefixIcon: Icon(Icons.date_range),
                          ontap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.parse('2010-01-01'),
                                    lastDate: DateTime.parse('2030-01-01'))
                                .then((value) {
                              //Todo: handle date to string
                              //print(DateFormat.yMMMd().format(value!));
                              var tdate = value.toString().split(' ');
                              datecontroller.text = tdate[0];
                            });
                          },
                          onvalidate: (value) {
                            if (value!.isEmpty) {
                              return "date must not be empty";
                            }
                          },
                          text: "date"),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defaultTextFormField(
                                readonly: true,
                                controller: starttimecontroller,
                                inputtype: TextInputType.number,
                                prefixIcon: Icon(Icons.watch_later_outlined),
                                ontap: () {
                                  showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then((value) {
                                    // print(value!.format(context).toString());
                                    starttimecontroller.text =
                                        value!.format(context).toString();
                                    print(starttimecontroller.text);
                                    //! 1970-01-01 time selected:00.000
                                    // print(DateFormat("hh:mm a")
                                    //     .parse(timecontroller.text.toString()));
                                  });
                                },
                                onvalidate: (value) {
                                  if (value!.isEmpty) {
                                    return "time must not be empty";
                                  }
                                },
                                text: "From"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: defaultTextFormField(
                                readonly: true,
                                controller: endtimecontroller,
                                inputtype: TextInputType.number,
                                prefixIcon: Icon(Icons.watch_later_outlined),
                                ontap: () {
                                  showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then((value) {
                                    endtimecontroller.text =
                                        value!.format(context).toString();
                                    //! 1970-01-01 time selected:00.000
                                    // print(DateFormat("hh:mm a")
                                    //     .parse(timecontroller.text.toString()));
                                  });
                                },
                                onvalidate: (value) {
                                  if (value!.isEmpty) {
                                    return "time must not be empty";
                                  }
                                },
                                text: "To"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //NOTE Remind
                      
                      // Obx(
                      //   () => defaultTextFormField(
                      //     readonly: true,
                      //     hinttext:
                      //         "${todocontroller.selectedRemindItem.value} minutes early",
                      //     controller: remindcontroller,
                      //     inputtype: TextInputType.name,
                      //     suffixIcon: DropdownButton(
                      //       underline: Container(
                      //         height: 0,
                      //       ),
                      //       icon: Icon(Icons.keyboard_arrow_down,
                      //           color: Colors.grey),
                      //       iconSize: 25,
                      //       elevation: 4,
                      //       items: remindList
                      //           .map<DropdownMenuItem<String>>((int value) {
                      //         return DropdownMenuItem<String>(
                      //             value: value.toString(),
                      //             child: Text(value.toString()));
                      //       }).toList(),
                      //       onChanged: (value) {
                      //         todocontroller.onchangeremindlist(value);
                      //         print(todocontroller.selectedRemindItem.value);
                      //       },
                      //       //! to display number beside the arrow
                      //       // value: todocontroller.selectedRemindItem.value,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                       MaterialButton(
      minWidth: 50,
      height: 50 ,
      onPressed: () {
        if (_formkey.currentState!.validate()){

           orderdetail.orderbusiness(context: context, 
          worker: worker!,
           date: datecontroller.text,
            from: starttimecontroller.text,
             to: endtimecontroller.text,
              username: user.name,
               userphone: user.phone,
                status: 'sent');


            }
        print( 'send request');
        
      },
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black),
          borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: const Text(
        'Send request',
        style: TextStyle(
          color: Color.fromARGB(235, 216, 171, 82),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
     /*SizedBox(
                        height: 20,
                      ),
                       MaterialButton(
      minWidth: 50,
      height: 50 ,
      onPressed: () {
       
        print( 'show my request');
      // child: _buildlistorder(context);
        
      },
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Colors.black),
          borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: const Text(
        'show my request',
        style: TextStyle(
          color: Color.fromARGB(235, 216, 171, 82),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),*/
    SizedBox(height: 20,),
   flag==1?Container(
child: Card(
            margin: EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
              title: Text(myorder.username,
               ),
              subtitle: Text(myorder.userId),
              leading: Text('My order',
              style:TextStyle(color:Color.fromARGB(235, 216, 171, 82),)),
              trailing: Text(myorder.status),
            )),
    ):Text(''),

   
   
                    ],
                    
                  ),
                  
                ),
              
              ),
            
 //SizedBox(height: 10,),
    
    //  height: MediaQuery.of(context).size.height*0.75,
        /* worker!.order!=null? ListView.builder(itemCount: worker!.order!.length,itemBuilder: (context, index) {
          for(int i=0;i<worker!.order!.length;i++){
            if (worker.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myorder = worker.order![i];
      }
          }
          return myorder!=null? Card(
            margin: EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
              title: Text(myorder.username,style: TextStyle(fontSize: 22),),
              subtitle: Text(myorder.userId ,style: TextStyle(fontSize: 18),),
              trailing: Text(myorder.status==0?'sent':'')
            ),
          ):Text('');
        }):Text("no booking request sent"),*/
     
            ],
            

          ),
        ),
        
      );

  }
   

 _appbar() {
    return AppBar(
      title: Text('booking request'),
      backgroundColor: Color.fromARGB(235, 216, 171, 82),
      
         
      
    );
  }

_buildlistorder(BuildContext context){

 
                        return Card(
            margin: EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
              title: Text("hello"),
            ));

                       

}




  }

