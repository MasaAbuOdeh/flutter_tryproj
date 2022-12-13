import 'package:flutter/material.dart';
class page3 extends StatefulWidget{
  const page3({Key? key}):super(key:key);
  @override
  _page3State createState()=> _page3State();


}
class _page3State extends State<page3>with TickerProviderStateMixin{


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
                itemCount:50,
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
                          //alignment: Alignment(-.2, 0),
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoQ16iPsJPyqI0Sl_j2UkA7L232ln1tuUj3Q&usqp=CAU"

                          ),

                          fit: BoxFit.cover,
                        ),

                      ),
                      padding: const EdgeInsets.only(left: 10, top: 200),
                      child: Row(
                        children: [
                          const Text(
                            'Waseem Al-Zain',
                            style: TextStyle(
                                color: Colors.white,
                                //  backgroundColor: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold

                            ),
                          ),
                          //SizedBox(width: 160,),
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