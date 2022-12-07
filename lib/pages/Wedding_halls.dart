
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/common/widgets/stars.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/pages/recomanded.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/business_info.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:flutter_try/widget/loader.dart';
import 'package:flutter_try/widget/single.dart';
import 'package:provider/provider.dart';
class hallsPage extends StatefulWidget{
const hallsPage({Key? key}):super(key:key);

  get workers => null;
  get recomend=> null;
 // get temp =>null;
  //get workerdata => null;
@override
_hallsPageState createState()=> _hallsPageState();


}
class _hallsPageState extends State<hallsPage> with TickerProviderStateMixin {
  
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

   // initState();
        
    
   
        
    
    final worker = Provider.of<WorkerProvider>(context).worker;
    
   // recomend=workers;
    
   
    
    TabController _tabController = TabController(length: 2, vsync: this);
    return recomend == null
        ? const Loader()
        : Scaffold(
          
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black,),
                /* Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Colors.grey,
                  ),
                )*/
              ],
            ),
          ),

          SizedBox(height: 40,),


          const Text(
            ' Find Your Dream Hall',

            style: TextStyle(

                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold

            ),
          ),
          SizedBox(height: 20,),

          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2)
                  )
                ]
            ),
            height: 60,
            child: const TextField(
              keyboardType: TextInputType.name,
              style: TextStyle(
                  color: Colors.black87
              ),


              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: Colors.black38
                  )
              ),
            ),

          ),
          SizedBox(height: 10,),

          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:CircleTabIndicator(color: Colors.black87, radius: 4),
                  tabs: [
                    Tab(text: "All"),
                    Tab(text: "Recommended",),
                  ]
              ),
            ),
          ),
          Container(
padding: const EdgeInsets.only(left: 20),

            height: 490,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [

                
               
               ListView.builder(

                
                 itemCount:workers!.length,
                 scrollDirection: Axis.vertical,
                 itemBuilder: (BuildContext context, int index) {

                  
  
   // for (int l = 0; l < workers![i]!.rating!.length; l++) {
    //  totalRating += workers![i].rating![l].rating;}
   //   if(totalRating!=0){
    //    avrgi=totalRating/workers![i]!.rating!.length;
     // }
           
     
         //for(int j=i+1; j<workers!.length;j++ ){
         // int i=index;

      

                  
                
           
                 // final workerdata1 = workers![index];
                

                  double totalRatingg = 0;
    for (int i = 0; i < workers![index]!.rating!.length; i++) {
      totalRatingg += workers![index].rating![i].rating;
      
    }

    if (totalRatingg != 0) {
      avgRating = totalRatingg / workers![index].rating!.length;
     
    }
    else{
      avgRating=0.0;
    }
                  
                  return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Detail',arguments: workers![index]);Colors.red[200];
                          print(workers![index].name+'pressed');
                          
                        },
     // mainAxisSize: MainAxisSize.max,
      //padding: const EdgeInsets.symmetric(horizontal: 5),
      //child: Column(

        child: Container(
          width:double.maxFinite,
          height: 400,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.only(right: 17, top: 20),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 20,
                spreadRadius: 5
              )
            ]
          ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
        BoxShadow(
          offset: Offset(0,17),
          blurRadius: 17,
          spreadRadius: -23,
         // color: kElevationToShadow,
        )
      ],
                  image: DecorationImage(
                    fit : BoxFit.cover,
                    image: NetworkImage(workers![index].images[0]==null? "https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg":workers![index].images[0])
                     )
                ) ,
              ),
              SizedBox(height: 10,),
              
              //Text(workerdata.name, style: TextStyle(fontSize: 35),),
              //SizedBox(height: 5,),
              Row(
                children: [
                  Text(workers![index].name, style: TextStyle(fontSize: 20),),
                  SizedBox(width: 45,),
              Stars(rating: avgRating,),
                ],
              ),
              SizedBox(height: 5,),
              Text(workers![index].price==null?"":'\$${workers![index].price}', style: TextStyle(fontSize: 20),),
              
              


            ],
          ),
        ),
        
      ) 
    ;

                 },

               ),

ListView.builder(

                
                 itemCount:recomend!.length-4,
                 scrollDirection: Axis.vertical,
                 itemBuilder: (BuildContext context, int index) {

                  
  
   // for (int l = 0; l < workers![i]!.rating!.length; l++) {
    //  totalRating += workers![i].rating![l].rating;}
   //   if(totalRating!=0){
    //    avrgi=totalRating/workers![i]!.rating!.length;
     // }
           
     
         //for(int j=i+1; j<workers!.length;j++ ){
         // int i=index;

      

                  
                
           
                 // final workerdata1 = workers![index];


               /*  for ( index = 0; index < recomend!.length; index++){
            for ( j= index+1;j<recomend!.length; j++){
             for (int l = 0; l < recomend![index]!.rating!.length; l++) {

          totalRatingi+=recomend![index].rating![l].rating;}
          avrgi=totalRatingi/recomend![index].rating!.length;
           for (int m = 0; m < recomend![j]!.rating!.length; m++){

          totalRatingj+=recomend![j].rating![m].rating; }
          avrgj=totalRatingj/recomend![j].rating!.length;


             if(avrgi<avrgj){

              temp=recomend![index] ;

            recomend![index]=recomend![j];
            recomend![j]=temp as Worker;

          }

            }

            

            



          

          
          
          
          
          

          
          

        
            //i=i-1;

      


         // for (int l = 0; l < workers![i]!.rating!.length; l++) {
          //  if((workers![i].rating![l].rating) < (workers![j].rating![l].rating)){

            //  temp=workers![i] ;

           // workers![i]=workers![j];
           // workers![j]=temp as Worker; 
           // }
            // totalRating += workers![i].rating![l].rating;}
//for (int m=0;m<workers![j]!.rating!.length;m++){
        // totalRatingjj +=workers![j].rating![m].rating;
         // }

        //  if(totalRating!=0){
        //avrgi=totalRating/workers![i]!.rating!.length;
    //  }
     // if(totalRatingjj!=0){
     //  avrgj=totalRatingjj/workers![j]!.rating!.length;
    //  }

    //  totalRating += workers![i].rating![l].rating;}
         // for (int m=0;m<workers![j]!.rating!.length;m++){
         //   totalRatingjj +=workers![j].rating![m].rating;
         // }
         // if(totalRatingjj!=0){
       // avrgj=totalRatingjj/workers![j]!.rating!.length;
     // }
       //if(avrgi<avrgj){
         // int j=i+1;
                 //  temp=workers![i] ;

           // workers![i]=workers![j];
           // workers![j]=temp as Worker;  
            //print(temp); 
                    

        

        //i= i+1;
                    
         }*/


         

                  double totalRatingg = 0;
    for (int i = 0; i < recomend![index]!.rating!.length; i++) {
      totalRatingg += recomend![index].rating![i].rating;
      
    }

    if (totalRatingg != 0) {
      avgRating = totalRatingg / recomend![index].rating!.length;
      
    }
    else{
      avgRating=0.0;
    }
                  
                  return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Detail',arguments: recomend![index]);Colors.red[200];
                          print(recomend![index].name+'pressed');
                          
                        },
     // mainAxisSize: MainAxisSize.max,
      //padding: const EdgeInsets.symmetric(horizontal: 5),
      //child: Column(

        child: Container(
          width:double.maxFinite,
          height: 400,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.only(right: 17, top: 20),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 20,
                spreadRadius: 5
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
        BoxShadow(
          offset: Offset(0,17),
          blurRadius: 17,
          spreadRadius: -23,
         // color: kElevationToShadow,
        )
      ],
                  image: DecorationImage(
                    fit : BoxFit.cover,
                    image: NetworkImage(recomend![index].images[0])
                     )
                ) ,
              ),
              SizedBox(height: 10,),
              
              //Text(workerdata.name, style: TextStyle(fontSize: 35),),
              //SizedBox(height: 5,),
              Row(
                children: [
                  Text(recomend![index].name, style: TextStyle(fontSize: 20),),
                  SizedBox(width: 45,),
              Stars(rating: avgRating,),
                ],
              ),
              SizedBox(height: 5,),
              Text('\$${recomend![index].price}', style: TextStyle(fontSize: 20),),
              
              


            ],
          ),
        ),
        
      ) 
    ;

                 },

               ),
             //  Text("data"),


                 
              ],
            ),

          ),

        ],
      ),
    );
  }
}
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback ?onChanged]) {
    // TODO: implement createBoxPainter
   return  _CirclePainter(color:color, radius:radius);
  }

    }


class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset,
      ImageConfiguration configuration) {
    Paint _paint=Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset=Offset(configuration.size!.width/2 -radius/2 ,configuration.size!.height-radius );
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}