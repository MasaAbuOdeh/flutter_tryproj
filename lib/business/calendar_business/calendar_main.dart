import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_try/business/calendar_business/res/event_firestore_service.dart';
import 'package:flutter_try/business/calendar_business/ui/add_event.dart';
import 'package:flutter_try/business/calendar_business/ui/view_event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_try/business/calendar_business/model/event.dart';

class firecalendar extends StatefulWidget {
  @override
  _firecalendarState createState() => _firecalendarState();
}

class _firecalendarState extends State<firecalendar> {
   DateTime selectedDay = DateTime.now();
   DateTime focusedDay = DateTime.now();
  late Map<DateTime, List<dynamic>> _events;
  CalendarFormat format = CalendarFormat.month;
  late List<dynamic> _selectedEvents;
  List<dynamic> _getEventsfromDay(DateTime date) {
    return _events[date] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _events = {};
    _selectedEvents = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
              eventLoader: _getEventsfromDay,
              calendarFormat: CalendarFormat.month,
              onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
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
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusedDay);
            },
            ),
            ..._selectedEvents.map((event) => ListTile(
                  title: Text(event.title),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => EventDetailsPage(
                                  event: event,
                                )));
                  },
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>  {}
      ),
    );
  }
}