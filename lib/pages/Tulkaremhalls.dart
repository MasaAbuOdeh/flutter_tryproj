import 'package:flutter/material.dart';
import 'package:flutter_try/common/widgets/stars.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:flutter_try/widget/loader.dart';
import 'package:provider/provider.dart';

class Tulkaremhalls extends StatefulWidget{
const Tulkaremhalls({Key? key}):super(key:key);

  get workers => null;
  get recomend=> null;
 // get temp =>null;
  //get workerdata => null;
@override
_TulkaremhallsState createState()=> _TulkaremhallsState();


}
class _TulkaremhallsState extends State<Tulkaremhalls> with TickerProviderStateMixin {
  List <Worker> ? workers ;
  final WorkerAuthService hall = WorkerAuthService();
  late Worker temp;

  showallhalls() async{
    
    workers = await hall.showhallsTulkarem(context);
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
          appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
            
             image: DecorationImage(
            image: NetworkImage("https://i.pinimg.com/564x/ec/d4/97/ecd4974ed81d210fb5aa6ac4ad01ab7a.jpg"), fit: BoxFit.cover)
              
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.network(
                  'https://cdn5.vectorstock.com/i/1000x1000/39/44/abstract-outline-color-of-a-young-elegant-bride-vector-9743944.jpg',
                  width: 120,
                  height: 45,
                  color: Colors.transparent,
                ),
              ),
               Text(
                "Price",
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 116, 116),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 40,),
        

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