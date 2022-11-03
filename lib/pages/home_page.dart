
import 'package:flutter/material.dart';
import 'package:flutter_try/widget/Categoryard.dart';

class home_page extends StatefulWidget{
  const home_page({super.key});
  
  @override
  _home_pageState createState() =>_home_pageState(); 
  
}
class _home_pageState extends State<home_page>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
        return Scaffold(
          body: Stack(
            children:<Widget> [
              Container(
                height: size.height*0.45,
                width:double.maxFinite,
                decoration: BoxDecoration(
                 // color: Colors.red[100],
                  image: DecorationImage(
                    //alignment: Alignment.centerLeft,
                    image: NetworkImage("https://i.pinimg.com/564x/15/f6/16/15f616cd18c88a1f917ac1267a87faf8.jpg"),
                    
                  )
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 231, 175, 181).withOpacity(0.2),
                            shape: BoxShape.circle,

                          ),
                          child: 
                                Image.network("https://cdn-icons-png.flaticon.com/128/130/130918.png"),
                        ),
                      ),
                      Text(
                        "Plan your own wedding ",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w400,fontSize: 45,),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29.5),
                        ),
                        child: TextField(
                          decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14,),
                prefixIcon: Icon(
                    Icons. search,
                    color: Colors.black38,
                    size: 35,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.black38,
                    

                )
            ),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount:2,
                          childAspectRatio: 0.88,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          
                          
                          children: <Widget>[
                            Categoryard(
                              
                              title:"wedding halls",
                              svgSrc: "https://i.pinimg.com/564x/ff/29/9b/ff299bf780591230a84feab495527e66.jpg",
                              printt:'halls',
                            ),
                              Categoryard(
                              title:"Wedding Cars",
                              svgSrc: "https://i.pinimg.com/564x/27/4d/b4/274db4b11ff4292b1147da1f2e0febb6.jpg",
                              printt:'cars',
                            ),
                            
                            Categoryard(
                              title:"photography",
                              svgSrc: "https://www.hockwoldhallnorfolk.com/wp-content/uploads/2017/02/wedding-photographer.jpg",
                              printt:'halls',
                            ),
                            
                            Categoryard(
                              title:"wedding cake ",
                              svgSrc: "https://i.pinimg.com/564x/da/1d/ae/da1dae0c3599794df32921fdb039d821.jpg",
                              printt:'halls',
                            ),
                            
                            
                            Categoryard(
                              title:"wedding cake ",
                              svgSrc: "https://cdn-icons-png.flaticon.com/512/2474/2474337.png",
                              printt:'halls',
                            ),
                            
                            Categoryard(
                              title:"wedding cake ",
                              svgSrc: "https://cdn-icons-png.flaticon.com/512/2474/2474337.png",
                              printt:'halls',
                            ),
                            


                          ], ) ,
                      )
                    ],
                  ), ),
              )
            ],
          ),
        );
    throw UnimplementedError();
  }

}