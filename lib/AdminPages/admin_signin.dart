import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_try/common/widgets/custom_button.dart';
import 'package:flutter_try/common/widgets/custom_textfield.dart';
import 'package:flutter_try/services/auth_service.dart';

class LoginAdmin extends StatefulWidget {
  @override
  _LoginAdminState createState()=>_LoginAdminState();
}


class _LoginAdminState extends State<LoginAdmin>{


  bool isRememberMe=false;
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  //final WorkerAuthService workerauth = WorkerAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

   @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
   
  }

  void signInAdmin() {
    authService.signInAdmin(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {

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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.transparent,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          sheef: false,
                        ),
                        const SizedBox(height: 50),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          sheef: true,
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInAdmin();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),),
    
      
    );


  }
  }