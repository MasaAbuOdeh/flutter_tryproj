
import 'package:flutter_try/common/widgets/custom_button.dart';
import 'package:flutter_try/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/fire/methodss.dart';
import 'package:flutter_try/services/auth_service.dart';
import 'package:flutter_try/services/workerauth.dart';


enum Auth {
  signin,
  signup,
}

class WorkerSignup extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const WorkerSignup({Key? key}) : super(key: key);

  @override
  State<WorkerSignup> createState() => _WorkerSignupState();
}

class _WorkerSignupState extends State<WorkerSignup> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final WorkerAuthService workerauth = WorkerAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late int selectedRadio;
  var Type;
  var errortype;
  fire create =fire();


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    workerauth.signUpUser(
      context: context,
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text,
      phone: _phoneController.text,
      type: Type,
    );
  }

  void signInUser() {
    workerauth.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
   void initState(){
    super.initState();
    selectedRadio=0;
   }

   setSelectedRaio(int val){
    setState(() {
      selectedRadio=val;
      errortype=selectedRadio;
      if(selectedRadio==1)
      Type="halls";
      else if (selectedRadio==2)
      Type="Band group";
      else if (selectedRadio==3)
      Type="Decorate";
      else if (selectedRadio==4)
      Type="photography";
      else 
      errortype=1;
      
    });
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://i.pinimg.com/564x/5c/e4/52/5ce45215d64696666d1e0b77e5989fc7.jpg"), fit: BoxFit.cover),
),


      child: Scaffold(
        backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  //activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              SizedBox(height:5,
                  width:80,
                ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.transparent,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Name',
                          sheef: false,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          sheef: false,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          sheef: true,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _phoneController,
                          hintText: 'phone',
                          sheef: false,
                        ),

                        const SizedBox(height: 0),

                        Row(children: [
                          Radio(value: 1,
                         groupValue: selectedRadio,
                          onChanged: (val){
                            print("R $val");
                            setSelectedRaio(val!);

                          }),
                          const SizedBox(width: 10,height: 5,
                          ),
                          Text("halls"),
                          const SizedBox(width: 70,),
                           Radio(value: 2,
                         groupValue: selectedRadio,
                          onChanged: (val){
                            print("R $val");
                            setSelectedRaio(val!);

                          }),
                        
                          const SizedBox(width: 10),
                          Text("Band group"),
                          

                        ],
                        ),
                        Row(children: [
                         const SizedBox(height: 0,),
                           Radio(value: 3,
                         groupValue: selectedRadio,
                          onChanged: (val){
                            print("R $val");
                            setSelectedRaio(val!);

                          }),
                        
                          const SizedBox(width: 10),
                          Text("Decorate"),
                          const SizedBox(width: 40,),
                           Radio(value: 4,
                         groupValue: selectedRadio,
                          onChanged: (val){
                            print("R $val");
                            setSelectedRaio(val!);

                          }),
                        
                           SizedBox(width: 10,
                          ),
                          Text("photography"),
                        ],),
                        
                          const SizedBox(height: 20),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()&&(errortype!=null)) {
                              signUpUser();
                              create.createAccount(_nameController.text, _emailController.text, _passwordController.text).then((user) {
            if (user != null) {
              setState(() {
                
              });
              
              print("Account Created Sucessfull");
            } else {
              print("Login Failed");
              setState(() {
                
              });
            }
          });

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
                  'Sign In.',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xeee0aa3e),
                      fontSize: 30
                    ),
                ),
                leading: Radio(
                 // activeColor: GlobalVariables.secondaryColor,
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                    
                  color: Colors.transparent,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          sheef: false,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          sheef: true,
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