import 'package:flutter/material.dart';
import 'package:flutter_try/admin/page1hall.dart';
import 'package:flutter_try/admin/page2hall.dart';
import 'package:flutter_try/admin/page3.dart';
import 'package:flutter_try/admin/page4.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/services/workerauth.dart';

class homeTab extends StatefulWidget{
  const homeTab({Key? key}):super(key:key);
  get workers => null;
  @override
  _homeTabState createState()=> _homeTabState();
  


}
class _homeTabState extends State<homeTab> with TickerProviderStateMixin {
  List <Worker> ? workers ;
   List<Worker> ? recomend;
   List <int> ? tryy;
   double minimum=0;
   int j =0;
   
   //late  Worker temp  ;
  final WorkerAuthService hall = WorkerAuthService();
  @override
  
  showallhalls() async{
    
    workers = await hall.showAllhalls(context);
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
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
    body: Column(
      children: [
        Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.topCenter,
            child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20,top: 10),
                controller: _tabController,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:CircleTabIndicator(color: Colors.black87, radius: 4),
                tabs: [
                  Tab(text: "Halls"),
                  Tab(text: "Dabkah",),
                  Tab(text: "Photography",),
                  Tab(text: "Event Planner",),
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
              page1(),
             page2(),
             page3(),
             page4(),
             /* ListView.builder(
                  itemCount:3,
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

                          image: const DecorationImage(
                            alignment: Alignment(-.2, 0),
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF1CzpIx8Jxz3ue8eE3xec0Ah6jEOE5DGBjA&usqp=CAU"

                            ),

                            fit: BoxFit.cover,
                          ),

                        ),
                        padding: const EdgeInsets.only(left: 10,top: 200) ,
                        child: Row(
                          children: [
                            const Text(
                              'Hayat Nablus\nOwner:______ ',
                              style: TextStyle(
                                  color: Colors.white,
                                  //  backgroundColor: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold

                              ),
                            ),
                            SizedBox(width:195,),
                            IconButton(onPressed: (){


                            }, icon: Icon(Icons.delete_outlined),color: Colors.white,iconSize: 25,)
                          ],
                        ),
                      );







                  }


              ),*/


              //Text("kkkkkkkk"),
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