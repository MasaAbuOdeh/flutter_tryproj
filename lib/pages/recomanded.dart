
import 'package:flutter/material.dart';

class recomended extends StatefulWidget{
  const recomended({Key? key}):super(key:key);
  @override
  _recomendedState createState()=> _recomendedState();


}
class _recomendedState extends State<recomended>{
  DateTime dateTime=DateTime(2022,22,11,0,0);
  @override
  Widget build(BuildContext context){
    return Container(

      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1617785258979-b50ebd43871e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YnJpZGUlMjBhbmQlMjBncm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80"), fit: BoxFit.cover)),

      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
         // child: Padding(
          //padding: const EdgeInsets.symmetric(horizontal:30,vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Text('\nThe day of your reservation:\n\t\t\t\t\t\t\t\t\t\t\t\t\t${dateTime.day}/${dateTime.month}/${dateTime.year}\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${dateTime.hour}:${dateTime.minute}',
              style: const TextStyle(fontSize: 30,
              color:Color.fromARGB(255, 255, 205, 210),
              fontWeight: FontWeight.bold,
              shadows:[Shadow(color: Colors.black,
              offset: Offset(6, 7),
              blurRadius: 8)] ),
              
            ),
            const SizedBox(height: 40,),

                Container(
                  padding: EdgeInsets.only(bottom: 25),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    shape:RoundedRectangleBorder(
                      side: const BorderSide(color:Color.fromARGB(255, 255, 205, 210),width: 5),
                      borderRadius: BorderRadius.circular(15)),
          child: const Text('Select your date',
                  style: TextStyle(fontSize: 30,
                  color: Color.fromARGB(255, 8, 8, 8),
                  ),),
                  onPressed: ()async{
                    DateTime? newDate=await showDatePicker(
                    context: context, initialDate: dateTime, firstDate: DateTime(2022), lastDate: DateTime(2100));
                    if(newDate==null)return;


                    TimeOfDay?newTime=await showTimePicker(context: context, initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

                   if(newTime==null)return;
                   final newDateTime=DateTime(newDate.year,
                   newDate.month,
                     newDate.day,
                     newTime.hour,
                      newTime.minute);
                    setState(() {
                      dateTime=newDate;
                    });
                  },)),
                ]),
    ),
      )
      );




  }
}