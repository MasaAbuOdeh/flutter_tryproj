import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/AdminPages/HomeScreen.dart';
import 'package:flutter_try/AdminPages/admin_signin.dart';
import 'package:flutter_try/AdminPages/businessA.dart';
import 'package:flutter_try/AdminPages/clientA.dart';
import 'package:flutter_try/AdminPages/dabkeh.dart';
import 'package:flutter_try/AdminPages/events.dart';
import 'package:flutter_try/AdminPages/halls.dart';
import 'package:flutter_try/AdminPages/photography.dart';
import 'package:flutter_try/admin/admin_control_page.dart';
import 'package:flutter_try/business/DetailPage.dart';
import 'package:flutter_try/business/banddetail.dart';
import 'package:flutter_try/business/business_screen.dart';
import 'package:flutter_try/business/calendar_nofire/booking_req.dart';
import 'package:flutter_try/business/calendar_nofire/calendar_client.dart';
import 'package:flutter_try/business/commentPage.dart';
import 'package:flutter_try/business/decoratedetail.dart';
import 'package:flutter_try/business/maps.dart';
import 'package:flutter_try/business/photodetail.dart';
import 'package:flutter_try/fire/createaccount.dart';
import 'package:flutter_try/fire/login.dart';
import 'package:flutter_try/fire/search.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/pages/HomeScreen.dart';
import 'package:flutter_try/pages/SignUpScreen.dart';
import 'package:flutter_try/pages/Wedding_cars.dart';
import 'package:flutter_try/pages/Wedding_halls.dart';
import 'package:flutter_try/pages/WorkerSignup.dart';
import 'package:flutter_try/pages/aftersigninuser.dart';
import 'package:flutter_try/pages/afterworkersignin.dart';
import 'package:flutter_try/pages/alldecorate.dart';
import 'package:flutter_try/pages/allphotography.dart';
import 'package:flutter_try/pages/band_group.dart';
import 'package:flutter_try/pages/search_screen.dart';
import 'package:flutter_try/pages/welcome_page.dart';
import 'package:flutter_try/providers/Admin_provider.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';



void main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => WorkerProvider(),),
     
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      
       
    ),
    ChangeNotifierProvider(
      create: (context) => AdminProvider(),),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      routes: {
        'Buisnuiss':(context) => WorkerSignup(),
         'Client':(context) => AuthScreen(),
          'HomePage':(context) => after_signin_usr(),
          'hallsPage':(context) => hallsPage(),
          'cars':(context) => Wedding_cars(),
          'businessScreen':(context) => after_signin_wrkr(),
          '/Detail':(context) => DetailPage(),
          '/comment':(context) => commentPage(),
         // '/search':(context) => search_screen(),
          '/location':(context) => maps(),
          '/chat':(context) => CreateAccount(),
          '/searchh':(context) => CreateAccount(),
          '/firelog':(context) => LoginScreen(),
          '/searchhh':(context) => CreateAccount(),
          'Band':(context) => bandPage(),
          'Admin':(context) => LoginAdmin(),
          'halls':(context) => halls(),
          'clientA':(context) => clientA(),
          'businessA':(context) => businessA(),
          'started':(context) =>HomeScreen(), 
          'LoginAdmin':(context) =>LoginAdmin(),
          'letgo':(context) => business_screen(),
          '/booking':(context) => Calendar_client(),
          '/request':(context) => AddEventScreen(),
          'Adminside':(context) => Admin_Screen(),
          'photography':(context) =>allphotography(),
          '/Detailband':(context) => banddetail(),
          '/Detailphoto':(context) => photodetail(),
          'Decorate':(context) => decoratePage(),
          'Dabkeh':(context) => dabkeh(),
          'photograph':(context) => photography(),
          'Decor':(context) => decor(),
          '/detaildecore':(context) => decoratedetail()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
