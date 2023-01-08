import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_try/business/calendar_nofire/booking_req.dart';
import 'package:flutter_try/business/calendar_nofire/event.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar_client extends StatefulWidget {
  @override
  _Calendar_clientState createState() => _Calendar_clientState();
}

class _Calendar_clientState extends State<Calendar_client> {
  late Map<DateTime, List<dynamic>> _selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  late SharedPreferences prefs;

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    
    super.initState();
    _selectedEvents = {};
    initPrefs();
  }
  
 initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedEvents = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

   Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  List<dynamic> _getEventsfromDay(DateTime date) {
    return _selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Worker? worker =ModalRoute.of(context)!.settings.arguments as Worker?;
   
   final workerr = Provider.of<WorkerProvider>(context).worker;
   final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
         backgroundColor:Colors.red[200],
        title: Text("Bookings Calendar"),
        centerTitle: true,
      ),
      body:Container(
        child: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.red[200],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (dynamic event) => ListTile(
              title: Text(
                event.toString(),
              ),
            ),
          ),
         // SizedBox(height: 15,),
         /* MaterialButton (
                      
                      minWidth:30,
                      height: 25,

                      onPressed: ()async { print('info btn Pressed');
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                     sharedPreferences.remove('events');
                      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Calendar_client()
                            ),
                          );},
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(236, 216, 169, 74),
                          width: 3),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      color: Colors.white,
                        child:Row(
                            children: [
                              Icon(Icons.bookmark_add_outlined,color:Color.fromARGB(236, 216, 169, 74),size: 25,),

                        const Text(
                         '\t\t\t Delete',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(236, 216, 169, 74),
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Schyler-Regular',


                          ),
                        ),

                        ]
                    )
                ),*/
        ],

        
        
      ),

      
      
      ),
      floatingActionButton:FloatingActionButton.extended(
        splashColor: Colors.red[200],
        backgroundColor:Colors.red[200],
        onPressed: () {
          Navigator.of(context).pushNamed('/request',arguments: worker);Colors.red[200];
                          print(worker!.name+'pressed') ;
        },
        label: Text("Add a booking request"),
        icon: Icon(Icons.add),
      )
      
      
    );
  }
}