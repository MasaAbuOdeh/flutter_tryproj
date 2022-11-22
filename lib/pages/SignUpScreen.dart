import 'package:flutter_try/common/widgets/custom_button.dart';
import 'package:flutter_try/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/services/auth_service.dart';


enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text,
      phone: _phoneController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:30,vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                tileColor: _auth == Auth.signup
                    ? Colors.transparent
                    : Colors.transparent,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 30,
                      color: Color(0xeee0aa3e),
                    ),
                ),
                leading: Radio(
                 // activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              SizedBox(height:0,
                          width:150,
                          ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 35),
                  color: Colors.transparent,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _phoneController,
                          hintText: 'phone',
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? Colors.transparent
                    : Colors.transparent,
                title: const Text(
                  'Sign-In.',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xeee0aa3e),
                      fontSize: 30
                    ),
                ),
                leading: Radio(
                  //activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.transparent,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
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