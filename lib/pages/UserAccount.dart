import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:provider/provider.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState()=>_UserAccountState();
}


class _UserAccountState extends State<UserAccount>{
Worker ? woupdate  ;
final WorkerAuthService uppdate =WorkerAuthService();
final TextEditingController _emailController = TextEditingController();
 // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  
  Future updaterefresh()async{
    final worker = Provider.of<WorkerProvider>(context).worker;
return uppdate.updatinfo(context: context,id: worker.id, name: worker.name, email: worker.email, phone: worker.phone);

  }

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
  }



  bool isRememberMe=false;
  Widget buildEmail() {
    final worker = Provider.of<WorkerProvider>(context).worker;
    return FutureBuilder(future :updaterefresh(),builder: ((context, snapshot) {
       if(snapshot.hasData){
        print(snapshot.data);
        return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
              color:  Color.fromARGB(236, 216, 169, 74),
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
                    color: Color.fromARGB(236, 216, 169, 74),
                    blurRadius:6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.black87
            ),


            decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons. email,
                    color:  Color.fromARGB(236, 216, 169, 74),
                ),
                hintText: worker.email,
                hintStyle: TextStyle(
                    color: Color.fromARGB(236, 216, 169, 74),
                )
            ),
          ),

        )
      ],
    );
       }
       return CircularProgressIndicator();
    }));
    
    
    

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
     final worker = Provider.of<WorkerProvider>(context).worker;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Name',
          style: TextStyle(
              color: Color.fromARGB(236, 216, 169, 74),
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
                    color: Color.fromARGB(236, 216, 169, 74),
                    blurRadius:6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child:  TextField(
            controller: _nameController,
            obscureText: true,
            style: TextStyle(
                color: Color.fromARGB(236, 216, 169, 74),
            ),


            decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromARGB(236, 216, 169, 74),
                ),
                hintText: worker.name,
                hintStyle: TextStyle(
                    color: Color.fromARGB(236, 216, 169, 74),
                )
            ),
          ),

        )
      ],
    );
  }
  Widget buildPhone() {
     final worker = Provider.of<WorkerProvider>(context).worker;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Phone',
          style: TextStyle(
              color: Color.fromARGB(236, 216, 169, 74),
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
                    color: Color.fromARGB(236, 216, 169, 74),
                    blurRadius:6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child:  TextField(
            controller: _phoneController,
            obscureText: true,
            style: TextStyle(
                color: Color.fromARGB(236, 216, 169, 74),
            ),


            decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.phone,
                    color: Color.fromARGB(236, 216, 169, 74),
                ),
                hintText: worker.phone,
                hintStyle: TextStyle(
                    color: Color.fromARGB(236, 216, 169, 74),
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
                  color:Color.fromARGB(236, 216, 169, 74),),
              borderRadius: BorderRadius.circular(15)
          ),
          color: Colors.white,
          child: const Text(
            'LogOut',
            style: TextStyle(
              color: Color.fromARGB(236, 216, 169, 74),
              fontSize: 18,
              fontWeight: FontWeight.bold,


            ),
          ),
        )

    );

  }
  Widget buildUpdateBtn() {
    final worker = Provider.of<WorkerProvider>(context).worker;
    return Container(
        child:
        MaterialButton(
          minWidth: double.infinity,
          height: 60 ,

          onPressed: () =>uppdate.updatinfo(context: context,id:worker.id , name: _nameController.text,
 email: _emailController.text, phone: _phoneController.text),
          shape:RoundedRectangleBorder(
              side: const BorderSide(
                  color:Color.fromARGB(236, 216, 169, 74),),
              borderRadius: BorderRadius.circular(15)
          ),
          color: Colors.white,
          child: const Text(
            'Update',
            style: TextStyle(
              color: Color.fromARGB(236, 216, 169, 74),
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
      appBar: AppBar(
        title: Text("Update personal information"),
        backgroundColor: Color.fromARGB(236, 216, 169, 74),
      ),
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
                      vertical: 80
                  ), // EdgeInsets.symmetric
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Personal Data',
                          style: TextStyle(
                              color: Color.fromARGB(236, 216, 169, 74),
                              fontSize: 30,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                        const SizedBox(height: 30),
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