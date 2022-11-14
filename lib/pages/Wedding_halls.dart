
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
class hallsPage extends StatefulWidget{
const hallsPage({Key? key}):super(key:key);
@override
_hallsPageState createState()=> _hallsPageState();


}
class _hallsPageState extends State<hallsPage> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
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
          SizedBox(height: 30,),

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

            height: 450,
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
                      margin: const EdgeInsets.only(right: 15,top: 10),

                     width: 200,
                     height: 400,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.white,

                       image:const DecorationImage(

                         image:NetworkImage(
                             "https://i.pinimg.com/564x/9f/bc/e4/9fbce4b187c6de0563375047b2b5fb90.jpg"

                         ),
                        fit: BoxFit.cover,
                       ),

                     ),



                   //),



                  );

                 },

               ),
                Text(""),
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