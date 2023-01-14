import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
  static final onNotifications = BehaviorSubject<String?>();
  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,)async{
    
    var androidInitialize = new AndroidInitializationSettings('mipmap/ic_launcher');
    //var iosInitialize= new IOSInitializationSettings(); 
    var initializationsSettings = new InitializationSettings(android: androidInitialize,
        );
   await flutterLocalNotificationsPlugin.initialize(initializationsSettings ,onDidReceiveNotificationResponse:(payload) async {
        onNotifications.add(payload.payload); // add payload to the stream
  },); 
   
   
  }

   static Future showBigTextNotification({var id =0,required String title, required String body,
    var payload ="new payload", required FlutterLocalNotificationsPlugin fln
  } ) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    new AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: '',
      visibility: NotificationVisibility.public,

      playSound: true,
      
     //sound: RawResourceAndroidNotificationSound('mixkit-bell-notification-933'),
      importance: Importance.max,
      priority: Priority.high,
      ongoing: true,
      channelShowBadge: true,
      enableVibration: true,
      actions:[ 
        
      ] ,
      
      

      styleInformation: BigTextStyleInformation(''),
    );
    var not= NotificationDetails(android: androidPlatformChannelSpecifics,
       // iOS: IOSNotificationDetails()
    );
    await fln.show(0, title, body,not );
    
    
    
  }


}