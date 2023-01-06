import 'dart:convert';

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/constants/error_handling.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/constants/utils.dart';
import 'package:flutter_try/models/comment.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/businessDetail_services.dart';
import 'package:flutter_try/services/search_services.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class commentPage extends StatefulWidget{
  const commentPage({Key? key}):super(key:key);

  @override
  _commentPageState createState()=> _commentPageState();


}


 class _commentPageState extends State<commentPage> {
  List<Comment> ? comm;
  late Worker refreshworker;
final formKey = GlobalKey<FormState>();
final businessDetail_services commentdetail = businessDetail_services();
final TextEditingController commentController = TextEditingController();
final search_services getcomments =search_services();
 /* List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'pic': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-d5qr9WzS926jiHDPlYrCL01Eb0M8C8c4w&usqp=CAU',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];*/

 /* Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }*/

  List <Worker> ? workers ;
   List<Worker> ? recomend;
   List<Comment> ? commentsall;
   List <int> ? tryy;
   double minimum=0;
   int j =0;
   late int length_valid=0;
   //late  Worker temp  ;
  final WorkerAuthService hall = WorkerAuthService();
 
     double totalRatingi=0;
    double totalRatingj=0;
   double avgRating =0;


   late  Worker temp  ;
     double totalRating=0;
     double avrgi=0;
     //double totalRatingjj=0;
     double avrgj=0;

     /////////////////////////////
     ///
     //
     double totalratingworker=0;
     double totalratingrecomend=0;
     double avrgworker=0;

   
    
  //List <Worker> ? workers ;


@override


  

 /* showAllhalls() async{
   // workers = await hall.showAllhalls(context);
   // recomend=await hall.showAllhalls(context);
   // recomend=workers;
   
    
  //workers = await hall.showAllhalls(context);
  
  
  //recomend = await hall.showAllhalls(context);
  
  //recomend=workers;
 // recomend = await hall.showAllhalls(context);
  setState(() {

    
    
  });
  }*/


showrecomend() async{
  //workers = await hall.showAllhalls(context);
  //recomend=workers;
  recomend = await hall.showrecomendedhalls(context);

  double tri=0;
double trj=0;
double ai=0;
double aj=0;
        for(int i=0;i<recomend!.length;i++){

          for(int j=i+1;j<recomend!.length;j++){
           /* if(recomend![i].rating![i].rating<recomend![j].rating![j].rating){
              temp=recomend![i];
              recomend![i]=recomend![j];
              recomend![j]=temp;
            }*/
            for(int m=0;m<recomend![j].rating!.length;m++){
              trj+=recomend![j].rating![m].rating;
            }
            aj=trj/recomend![j].rating!.length;
            for(int k=0;k<recomend![i].rating!.length;k++){
            tri+=recomend![i].rating![k].rating;
          }
          ai=tri/recomend![i].rating!.length;


            if(ai<aj){
              temp=recomend![i];
              recomend![i]=recomend![j];
              recomend![j]=temp;
            }

          }
         }
  setState(() {
    
  });

  }

  
 

  Future showallhalls() async{
    
     workers = await hall.showAllhalls(context);
    for(int i=0;i<workers!.length;i++){
      if(workers![i].images[0].isNotEmpty){
        length_valid++;
        
      }

    }
    setState(() {
      
    });
  
  } 
       
  

  void initState() {
    // TODO: implement initState
    super.initState();
    showallhalls();
     showrecomend();
    
  
  }

  Future refreshh()async{

 final workerProvider = Provider.of<WorkerProvider>(context, listen: false);
 Worker? worker =ModalRoute.of(context)!.settings.arguments as Worker?;
 //return worker!.comment;
 String name=worker!.name;
 print(name);
 final List<Worker> workerlist=[];
 final List<Comment> newcomment =[] ;


 final userProvider = Provider.of<UserProvider>(context, listen: false);
  List <Worker> workerhalls =[];
  try {
          http.Response res = await http.get(Uri.parse('$uri/business/searchh/$name'), headers:{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
          }
          ) ;   
                      var resposebody=jsonDecode(res.body);
                      return resposebody;
                      
                      
          
  } catch (e) {
              showSnackBar(context, e.toString());
  }

 }

  @override
  Widget build(BuildContext context) {
    var refreshworker;
    final Worker? worker =ModalRoute.of(context)!.settings.arguments as Worker?;
    final user = Provider.of<UserProvider>(context).user;
    comm=worker!.comment;
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Comment Page"),
        backgroundColor: Colors.red[200],
      ),
      body: FutureBuilder (
        future:refreshh() ,
        builder: ((context, snapshot) {
            if(snapshot.hasData){
               print(snapshot.data[0]['comments'].length);
               
            //  print(map.values["comment"]);
              
            
          return Container(
        
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-d5qr9WzS926jiHDPlYrCL01Eb0M8C8c4w&usqp=CAU"),
          
           
            child: RefreshIndicator(
              
              onRefresh: refreshh,
              child: ListView.builder(
                itemCount:snapshot.data[0]['comments'].length ,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {

                  
       // for (int i = 0; i < snapshot.data[0]['comments'].length; i++)
        
          
          
            return ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: 'https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/512x512/plain/user.png')),
                ),
              ),
              title: Text(
                snapshot.data[0]['comments']![index]['username'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(snapshot.data[0]['comments']![index]['comment']),
             // trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            );
          
      

                },
      
    ), ),
          
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                /*var value = {
                  'name': 'New User',
                  'pic':
                      'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text,
                  'date': '2021-01-01 12:00:00'
                };*/
                commentdetail.Commentbusiness(context: context,
                 worker: worker!,
                  comment: commentController.text,
                  username: user.name );
                
                //filedata.insert(0, value);

              });
              commentController.clear();
             // refreshh();
              //commentdetail.showallcomments(context, worker.name);
              //getcomments.showallcomments(context, worker.name);
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.red[200],
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      );}
      return CircularProgressIndicator();

        }),

      ),
      
    );
  }
  
 

  
}