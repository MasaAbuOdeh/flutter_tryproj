import 'package:flutter/material.dart';
import 'package:flutter_try/common/widgets/stars.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:flutter_try/widget/loader.dart';
import 'package:provider/provider.dart';

class hallsmallrate extends StatefulWidget{
const hallsmallrate({Key? key}):super(key:key);

  get workers => null;
  get recomend=> null;
 // get temp =>null;
  //get workerdata => null;
@override
_hallsmallrateState createState()=> _hallsmallrateState();


}
class _hallsmallrateState extends State<hallsmallrate> with TickerProviderStateMixin {
  List <Worker> ? workers ;
  final WorkerAuthService hall = WorkerAuthService();
  late Worker temp;

  showallhalls() async{
    
    workers = await hall.showAllhalls(context);
    for(int i=0;i<workers!.length;i++){

          for(int j=i+1;j<workers!.length;j++){
           /* if(recomend![i].rating![i].rating<recomend![j].rating![j].rating){
              temp=recomend![i];
              recomend![i]=recomend![j];
              recomend![j]=temp;
            }*/
             double tri=0;
double trj=0;
double ai=0;
double aj=0;
            for(int m=0;m<workers![j].rating!.length;m++){
              trj+=workers![j].rating![m].rating;
            }
            aj=trj/workers![j].rating!.length;
            for(int k=0;k<workers![i].rating!.length;k++){
            tri+=workers![i].rating![k].rating;
          }
          ai=tri/workers![i].rating!.length;


            if(ai>aj){
              temp=workers![i];
              workers![i]=workers![j];
              workers![j]=temp;
            }

          }
         }
    setState(() {
      
    });
  
  } 
       
  

  void initState() {
    // TODO: implement initState
    super.initState();
    showallhalls();
     
    
  
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final worker = Provider.of<WorkerProvider>(context).worker;
    
   // recomend=workers;
    
   
    
    TabController _tabController = TabController(length: 1, vsync: this);
    return workers == null
        ? const Loader()
        : Scaffold(
          appBar: AppBar(
            title: Text("Rating from low to high"),
            backgroundColor:Color.fromARGB(235, 216, 171, 82) ,
          ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 40,),
          
         // SizedBox(height: 10,),

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
                 // indicator:CircleTabIndicator(color: Colors.black87, radius: 4),
                  tabs: [
                    Tab(text: "All"),
                    //Tab(text: "Recommended",),
                  ]
              ),
            ),
          ),
          Container(
padding: const EdgeInsets.only(left: 20),

            height: 600,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [

                
               
               ListView.builder(

                
                 itemCount:workers!.length,
                 scrollDirection: Axis.vertical,
                 itemBuilder: (BuildContext context, int index) {

double totalRatingg = 0;
double avgRating=0;

    for (int i = 0; i < workers![index]!.rating!.length; i++) {
      totalRatingg += workers![index].rating![i].rating;
      
    }

    if (totalRatingg != 0) {
      avgRating = totalRatingg / workers![index].rating!.length;
      
    }
    else{
      avgRating=0.0;
    }
                  
  
   // for (int l = 0; l < workers![i]!.rating!.length; l++) {
    //  totalRating += workers![i].rating![l].rating;}
   //   if(totalRating!=0){
    //    avrgi=totalRating/workers![i]!.rating!.length;
     // }
           
     
         //for(int j=i+1; j<workers!.length;j++ ){
         // int i=index;

      

                  
                
           
                 // final workerdata1 = workers![index];
                
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
             

        ]),
          )
        ],

        
        
      ),
    );

    
  }

}