import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
  class _SignUpScreenState extends State<SignUpScreen> {

    Widget buildEmail() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2)
                  )
                ]
            ),
            height: 50,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.black87
              ),


              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xffE5CC95)
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: Colors.black38
                  )
              ),
            ),

          )
        ],
      );
    }


    Widget buildName() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Name',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2)
                  )
                ]
            ),
            height: 50,
            child: TextField(
              keyboardType: TextInputType.name,
              style: TextStyle(
                  color: Colors.black87
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xffE5CC95)
                  ),
                  hintText: 'Name',
                  hintStyle: TextStyle(
                      color: Colors.black38
                  )
              ),
            ),

          )
        ],
      );
    }

    Widget buildPassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2)
                  )
                ]
            ),
            height: 50,
            child: TextField(
              obscureText: true,
              style: TextStyle(
                  color: Colors.black87
              ),


              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xffE5CC95)
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      color: Colors.black38
                  )
              ),
            ),

          )
        ],
      );
    }

    Widget buildConfirmPassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ' Phone number',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2)
                  )
                ]
            ),
            height: 50,
            child: TextField(
              obscureText: true,
              style: TextStyle(
                  color: Colors.black87
              ),


              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xffE5CC95)
                  ),
                  hintText: 'phone number',
                  hintStyle: TextStyle(
                      color: Colors.black38
                  )
              ),
            ),

          )
        ],
      );
    }

    Widget buildSignUpBtn() {
      return Container(
          child:
          MaterialButton(
            minWidth: double.infinity,
            height: 50,

            onPressed: () => print('SignUp Pressed'),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.white),
                borderRadius: BorderRadius.circular(15)
            ),
            color: Colors.white,
            child: Text(
              'SignUp',
              style: TextStyle(
                color: Colors.black26,
                fontSize: 18,
                fontWeight: FontWeight.bold,


              ),
            ),
          )

      );
    }

    Widget buildSignInBtn() {
      return GestureDetector(
        onTap: () => print("Sign In Pressed"),
        child: RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    text: 'already have an Account?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    )
                ),

                TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )
                )
              ]
          ),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: AnnotatedRegion <SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    //alignment: Alignment.centerLeft,
                    image: NetworkImage("https://i.pinimg.com/736x/d4/c4/40/d4c440f32014333cc00e5db376fb7dc9.jpg"),
                    
                  )


                  ),


                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 120
                    ), // EdgeInsets.symmetric
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sign Up ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold

                            ),
                          ),
                          Text(
                            ' \n create an account, its free',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold

                            ),
                          ),
                          SizedBox(height: 50),
                          buildName(),
                          SizedBox(height: 20),
                          buildEmail(),
                          SizedBox(height: 20),
                          buildPassword(),
                          SizedBox(height: 20),
                          buildConfirmPassword(),
                          SizedBox(height: 50),
                          buildSignUpBtn(),
                          buildSignInBtn(),


                        ]
                    ),
                  ),
                )
              ], //<Widget>[]
            ),
          ),
        ),
      );
    }


  }