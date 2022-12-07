import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState()=>_UserAccountState();
}


class _UserAccountState extends State<UserAccount>{


  bool isRememberMe=false;
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
              color:  Color(0xeeffb7c5),
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),

              boxShadow: [
                const BoxShadow(
                    color: Color(0xeeffb7c5),
                    blurRadius:6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.black87
            ),


            decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons. email,
                    color:  Color(0xeeffb7c5)
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                    color: Color(0xeeffb7c5)
                )
            ),
          ),

        )
      ],
    );

  }

 /* Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
              color: Color(0xeeffb7c5),
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                const BoxShadow(
                    color: Color(0xeeffb7c5),
                    blurRadius:6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
                color: Color(0xeeffb7c5)
            ),


            decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons. lock,
                    color: Color(0xeeffb7c5)
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: Color(0xeeffb7c5)
                )
            ),
          ),

        )
      ],
    );
  }*/
  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Name',
          style: TextStyle(
              color: Color(0xeeffb7c5),
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                const BoxShadow(
                    color: Color(0xeeffb7c5),
                    blurRadius:6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
                color: Color(0xeeffb7c5)
            ),


            decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xeeffb7c5)
                ),
                hintText: 'Name',
                hintStyle: TextStyle(
                    color: Color(0xeeffb7c5)
                )
            ),
          ),

        )
      ],
    );
  }
  Widget buildPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Phone',
          style: TextStyle(
              color: Color(0xeeffb7c5),
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                const BoxShadow(
                    color: Color(0xeeffb7c5),
                    blurRadius:6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
                color: Color(0xeeffb7c5)
            ),


            decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xeeffb7c5)
                ),
                hintText: 'Phone',
                hintStyle: TextStyle(
                    color: Color(0xeeffb7c5)
                )
            ),
          ),

        )
      ],
    );
  }



  Widget buildLogOutBtn() {
    return Container(
        child:
        MaterialButton(
          minWidth: double.infinity,
          height: 60 ,

          onPressed: () => print( 'LogOut Pressed'),
          shape:RoundedRectangleBorder(
              side: const BorderSide(
                  color:Color(0xeeffb7c5)),
              borderRadius: BorderRadius.circular(15)
          ),
          color: Colors.white,
          child: const Text(
            'LogOut',
            style: TextStyle(
              color: Color(0xeeffb7c5),
              fontSize: 18,
              fontWeight: FontWeight.bold,


            ),
          ),
        )

    );

  }
  Widget buildUpdateBtn() {
    return Container(
        child:
        MaterialButton(
          minWidth: double.infinity,
          height: 60 ,

          onPressed: () => print( 'Update Pressed'),
          shape:RoundedRectangleBorder(
              side: const BorderSide(
                  color:Color(0xeeffb7c5)),
              borderRadius: BorderRadius.circular(15)
          ),
          color: Colors.white,
          child: const Text(
            'Update',
            style: TextStyle(
              color: Color(0xeeffb7c5),
              fontSize: 18,
              fontWeight: FontWeight.bold,


            ),
          ),
        )

    );

  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion <SystemUiOverlayStyle> (
        value:SystemUiOverlayStyle.light,
        child:GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double. infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment. topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFFFFFF),
                          Color(0xffFFFFFF),
                          Color(0xffFFFFFF),
                          Color(0xffFFFFFF),
                        ]

                    )



                ),




                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120
                  ), // EdgeInsets.symmetric
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Personal Data',
                          style: TextStyle(
                              color: Color(0xeeffb7c5),
                              fontSize: 30,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                        const SizedBox(height: 50),
                        buildName(),
                        const SizedBox(height: 20),
                        buildPhone(),
                        const SizedBox(height: 20),
                        buildEmail(),
                        const SizedBox(height: 20),
                       // buildPassword(),
                        const SizedBox(height: 80),
                        buildUpdateBtn(),
                        const SizedBox(height: 20),
                        buildLogOutBtn(),





                      ]
                  ),
                ),
              )
            ],//<Widget>[]
          ),
        ),
      ),
    );





  }

}