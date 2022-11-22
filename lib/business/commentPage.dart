import 'package:flutter/material.dart';

class commentPage extends StatefulWidget{
  const commentPage({Key? key}):super(key:key);

  @override
  _commentPageState createState()=> _commentPageState();


}

mixin Timestamp {
  toDate() {}
}
 class _commentPageState extends State<commentPage> {


@override
Widget build(BuildContext context) {


  return Container(

    child: Scaffold(
    body: Stack(
      children: <Widget>[
        Container(color: Colors.white,height: MediaQuery.of(context).size.height,width:  MediaQuery.of(context).size.width,),
Positioned(
    top:40,
    left: 100,
    child: Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding:EdgeInsets.symmetric(horizontal: 10),
                  child:
                   const Text(
                      'Comments',

                          style: TextStyle(
                            color: Color(0xeee0aa3e),
                            fontWeight: FontWeight.normal,
                            fontSize: 35,
                          ),
                  ),
               decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xeee0aa3e), ),
                  ),
                ),

              )
            ],
          )
        ],

      ),

)),
        Positioned(
            left:10,
            top:38,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back), color:Color(0xeee0aa3e),



                )
              ],
            )),
Positioned(
    bottom: 0,
    child: Container(
  //color: Colors.pinkAccent,
  height: 50,
width: MediaQuery.of(context).size.width,
      child: Column(
          children: <Widget>[
        Row(
      children: <Widget>[

          Container(
              padding:EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width-40,
          child:
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top:14,left: 10),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xeee0aa3e),),
                borderRadius: BorderRadius.circular(30)
              ),

                hintText: ' Write a Comment',
                hintStyle: TextStyle(

                    color: Colors.black38

                )
            ),

          )

          ),
          Icon(Icons.send)
          ],)
      ],),

  ))
      ],
    ),

    ),
  );
  
  /*return Column(
    children: <Widget>[
      ListTile(
        title: Text(comment),
        subtitle: Text(timestamp.toDate().toString()),

      )
    ],
  );*/
  
  
  
  
  
  
  

}
}