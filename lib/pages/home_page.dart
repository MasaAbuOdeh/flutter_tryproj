
import 'package:flutter/material.dart';
import 'package:flutter_try/pages/search_screen.dart';
import 'package:flutter_try/widget/Categoryard.dart';

class home_page extends StatefulWidget{
  const home_page({super.key,
  });
  
  @override
  _home_pageState createState() =>_home_pageState(); 
  
}
class _home_pageState extends State<home_page>{

  void navegatetosearchscreen(String query){
   // Navigator.of(context).pushNamed("/search",arguments: query );Colors.red[200];
    Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => search_screen(
                                SearchQuery: query,
                              ),
                            ),
                          );

  }
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
                    image: NetworkImage("https://i.pinimg.com/564x/f4/40/8f/f4408f9bb2fcde9b434f62b486fda9ab.jpg"),
                    
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
                                IconButton(onPressed: (){}, icon:Icon(Icons.menu), color:Colors.black )
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
                        child: TextFormField(
                          onFieldSubmitted:navegatetosearchscreen, 
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
                              printt:'hallsPage',
                            ),
                              Categoryard(
                              title:"Band group",
                              svgSrc: "https://i.pinimg.com/564x/e1/8d/eb/e18deb2b7ceec7de1de1c3adf3e4fcbf.jpg",
                              printt:'Band',
                            ),
                            
                            Categoryard(
                              title:"photography",
                              svgSrc: "https://www.hockwoldhallnorfolk.com/wp-content/uploads/2017/02/wedding-photographer.jpg",
                              printt:'photography',
                            ),
                            
                            Categoryard(
                              title:"Decorate",
                              svgSrc: "https://i.pinimg.com/564x/34/ee/53/34ee53b2686e0014b2438e295eb6b05d.jpg",
                              printt:'Decorate',
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