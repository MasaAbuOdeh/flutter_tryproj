import 'package:flutter/material.dart';
import 'package:flutter_try/admin/adminprofile.dart';
import 'package:flutter_try/admin/homeTap.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/services/workerauth.dart';
class adminControlPage extends StatefulWidget{
  const adminControlPage({Key? key}):super(key:key);
  @override
  _adminControlPageState createState()=> _adminControlPageState();


}
class _adminControlPageState extends State<adminControlPage> with TickerProviderStateMixin{
  List <Worker> ? workers ;
  final WorkerAuthService hall = WorkerAuthService();
  int currentindex=0;
  final tabs=[
    homeTab(),
    adminProfileTab(),

  ];
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
   // TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
backgroundColor: Colors.white,

        title: Text('   Admin',style: TextStyle(
          color: Color(0xeeffb7c5),
          fontSize: 25
        ),

        ),
        
      ),
     /* body: Column(
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

    height: 630,
    width: double.maxFinite,
    child: TabBarView(
    controller: _tabController,
    children: [
    ListView.builder(
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
              IconButton(onPressed: (){}, icon: Icon(Icons.delete_outlined),color: Colors.white,iconSize: 25,alignment: Alignment.bottomRight,)
            ],
          ),
        );







    }


    ),


      //Text(""),
  ],
    ),
),
      ],
      ),*/
      body: tabs[currentindex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
type: BottomNavigationBarType.fixed,
selectedItemColor: Color(0xeeffb7c5),
unselectedItemColor: Colors.grey,
showSelectedLabels: false,
showUnselectedLabels: false,
iconSize: 30,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(

            icon: Icon(Icons.home,
            color:Color(0xeeffb7c5) ,),
          label: 'home',

          backgroundColor: Color(0xeeffb7c5),

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color:Color(0xeeffb7c5)),
            backgroundColor: Color(0xeeffb7c5),
            label: 'profile',


          ),

        ],
        onTap: (index){
          setState(() {
            currentindex=index;
          });
        },
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