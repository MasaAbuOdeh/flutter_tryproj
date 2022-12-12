import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin)async{
    var androidInitialize = new AndroidInitializationSettings('mipmap/ic_launcher');
    //var iosInitialize= new IOSInitializationSettings(); 
    var initializationsSettings = new InitializationSettings(android: androidInitialize,
        );
   await flutterLocalNotificationsPlugin.initialize(initializationsSettings ); 
  }

   static Future showBigTextNotification({var id =0,required String title, required String body,
    var payload ="", required FlutterLocalNotificationsPlugin fln
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
      
      

      styleInformation: BigTextStyleInformation(''),
    );
    var not= NotificationDetails(android: androidPlatformChannelSpecifics,
       // iOS: IOSNotificationDetails()
    );
    await fln.show(0, title, body,not );
  }
}