import 'package:flutter/material.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/services/workerauth.dart';
class page1 extends StatefulWidget{
  const page1({Key? key}):super(key:key);
  get workers => null;
  @override
  _page1State createState()=> _page1State();


}
class _page1State extends State<page1>with TickerProviderStateMixin{
  List <Worker> ? workers ;
   List<Worker> ? recomend;
   List <int> ? tryy;
   double minimum=0;
   int j =0;
   
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
  recomend = await hall.showrecomendedband(context);

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
 

  showallhalls() async{
    
    workers = await hall.showAllhalls(context);
    setState(() {
      
    });
  
  } 
       
  

  void initState() {
    // TODO: implement initState
    super.initState();
    showallhalls();
     showrecomend();
    
  
  }


  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 1, vsync: this);
    return Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
    color: Colors.white,

    height: 630,
    width: double.maxFinite,
    child: TabBarView(
    controller: _tabController,
    children: [
    ListView.builder(
    itemCount:workers!.length,
    scrollDirection: Axis.vertical,
    itemBuilder: (BuildContext context, int index) {
      return
        Container(
          margin: const EdgeInsets.only(right: 15, top: 15),

          width: 200,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,

            image:  DecorationImage(
              //alignment: Alignment(-.2, 0),
              image: NetworkImage(
                 workers![index].images[0],

              ),

              fit: BoxFit.cover,
            ),

          ),
          padding: const EdgeInsets.only(left: 10, top: 200),
          child: Row(
            children: [
               Text(
                workers![index].name,
                style: TextStyle(
                    color: Colors.white,
                    //  backgroundColor: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold

                ),
              ),
              //SizedBox(width: 180,),
              IconButton(onPressed: () {


              },
                icon: Icon(Icons.delete_outlined),
                color: Colors.white,
                iconSize: 25,
                alignment: Alignment.bottomRight,)
            ],
          ),
        );
    },
    ),
    ]
    )
    );
  }
  }