
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/services/business_info.dart';
import 'package:flutter_try/services/workerauth.dart';
import 'package:flutter_try/widget/loader.dart';
import 'package:flutter_try/widget/single.dart';
import 'package:provider/provider.dart';
class hallsPage extends StatefulWidget{
const hallsPage({Key? key}):super(key:key);

  get workers => null;

  get workerdata => null;
@override
_hallsPageState createState()=> _hallsPageState();


}
class _hallsPageState extends State<hallsPage> with TickerProviderStateMixin {
  
   List <Worker> ? workers ;
  final WorkerAuthService hall = WorkerAuthService();
  //List <Worker> ? workers ;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    showAllhalls();
  }

  showAllhalls() async{
  workers = await hall.showAllhalls(context);
  setState(() {
    
  });
  }

  @override
  Widget build(BuildContext context) {
    
    final worker = Provider.of<WorkerProvider>(context).worker;
    TabController _tabController = TabController(length: 2, vsync: this);
    return workers == null
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
            'Find Your Dream Hall',

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
                borderRadius: BorderRadius.circular(10),
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
                  final workerdata =workers![index];
                  
                  return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Detail',arguments: workerdata);Colors.red[200];
                          print(workerdata.name+'pressed');
                          
                        },
     // mainAxisSize: MainAxisSize.max,
      //padding: const EdgeInsets.symmetric(horizontal: 5),
      //child: Column(

        child: Column(
          
          
          children: [
          
          
         Container(
          
          
        
          decoration: BoxDecoration(
    
      color: Colors.white54,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          offset: Offset(0,17),
          blurRadius: 17,
          spreadRadius: -23,
         // color: kElevationToShadow,
        )
      ]
    ),
          alignment: Alignment.topCenter,
          width: double.maxFinite,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            workerdata.images[0],
            fit: BoxFit.cover,
           // width: 250,
            
            
          ),
          
          
          
        ),
      
      
      Container(
        alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 15,
                                right: 15,
                                bottom:15,
                              ),
                              decoration: BoxDecoration(
    
      color: Colors.white54,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          offset: Offset(0,17),
          blurRadius: 17,
          spreadRadius: -23,
         // color: kElevationToShadow,
        )
      ]
    ),
                              child: Text(
                                workerdata.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 30),
                              ),
      )
        ],
        ),
        
      ) 
    ;

                 },

               ),
                Text("Nablus"),
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