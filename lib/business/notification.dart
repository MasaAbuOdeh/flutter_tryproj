import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_try/common/widgets/custom_button.dart';
import 'package:flutter_try/common/widgets/custom_textfield.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/notification_api.dart';
import 'package:provider/provider.dart';

class notification extends StatefulWidget {
  
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
//Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  //final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final NotificationApi not = NotificationApi();
 // fire create =fire();
  //fire create = fire();


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }
  void initState() {
    super.initState();
    NotificationApi.initialize(flutterLocalNotificationsPlugin);
    
  } 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final worker = Provider.of<WorkerProvider>(context).worker;
    return Container(
      constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://i.pinimg.com/564x/5c/e4/52/5ce45215d64696666d1e0b77e5989fc7.jpg"), fit: BoxFit.cover)),


      child: Scaffold(
        backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:30,vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 35),
                  color: Colors.transparent,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'title',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'body',
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: 'push notification',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              
                              NotificationApi.showBigTextNotification(title: _nameController.text,
                              body: _emailController.text,
                              fln: flutterLocalNotificationsPlugin);
                              print("object");
          


                             // createaccount();
                          /*  final newUser=await create.createAccount(_nameController.text, _emailController.text,_passwordController.text,).then((user) {
            if (user != null) {
              setState(() {
                Loader();
              });
              
              print("Account Created Sucessfull");
            } else {
              print("Login Failed");
              setState(() {
                Loader();
              });
            }
          });*/

                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ]
            ),
        ),
      ),),
    
      
    );
                
  }

}