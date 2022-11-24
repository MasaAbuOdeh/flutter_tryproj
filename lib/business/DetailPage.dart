
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_try/common/widgets/stars.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/services/businessDetail_services.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget{
  static const String routeName ='halls-details';
  //final String worker;
  const DetailPage({
    Key? key,
    }):super(key:key);
@override
  _DetailPageState createState()=> _DetailPageState();


}
class _DetailPageState extends State<DetailPage>{
int gottenStars=4;
 final _buildFormKey = GlobalKey<FormState>();
final businessDetail_services details = businessDetail_services();
var business;
double avgRating = 0;
  double myRating = 0;
  @override
  void initState() {
    super.initState();
    
  }
  Widget build(BuildContext context){
    
   // Key:_buildFormKey;
    final Worker? worker =ModalRoute.of(context)!.settings.arguments as Worker?;
      double totalRating = 0;
    for (int i = 0; i < worker!.rating!.length; i++) {
      totalRating += worker.rating![i].rating;
      if (worker.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = worker.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / worker.rating!.length;
    }
    
    
      //business=worker;
    

    return Scaffold(

      body:Container(
        width: double.maxFinite,
        height: double.maxFinite,

        child: Stack(
children: [
Positioned(
    left:0,
    right:0,

    child: Container(

      width: double.maxFinite,
      height: 340,
      child: CarouselSlider(
              items: worker!.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.cover,
                      width:double.maxFinite,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),






      ),
    ),
///////////////////////////////////////////////

  Positioned(
      left:10,
      top:30,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon:Icon(Icons.menu), color:Colors.white



          )
        ],
      )),
  Positioned(
      top:340,
      child: Container(
padding: const EdgeInsets.only(left: 20,right: 20,top: 30) ,
    width: MediaQuery.of(context).size.width,
        height: 500,
decoration: BoxDecoration(
    color:Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
topRight: Radius.circular(50),
  )
),
child: Column(
  children: [
    Row(
      children: [
        Stars(rating: avgRating,),
        SizedBox(width: 10,),
        Text("Avareg Rating")
      ],
    ),
  
      // Stars(rating: 4.0,),
      
    
    SizedBox(height: 10,),
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          worker!.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.normal

          ),
        ),
        Text(
          '\$${worker.price}',
          style: TextStyle(
              color: Colors.black26,
              fontSize: 25,
              fontWeight: FontWeight.bold

          ),
        ),
         
        //AppLargeText(text:"Nadi Al-Madina",color:Colors.black),
        //AppLargeText(text:"\$ 20000"),
      ],
    ),
    SizedBox(height: 10,),
    Row(
      children: [
        Icon(Icons.location_on,color: Colors.black45,),
        SizedBox(width: 5,),
         Text(
         worker!.location ,
          style: TextStyle(
              color: Colors.black45,
              fontSize: 20,
              fontWeight: FontWeight.normal

          ),
        ),
      ],
    ),
    SizedBox(height: 10,),
    Row(children: [
      RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              onRatingUpdate: (rating) {
                details.rateProduct(
                  context: context,
                  worker: worker,
                  rating: rating,
                );
              },
            ),
      SizedBox(width: 10,),
      const Text(
        '(4.0)',
        style: TextStyle(
            color: Colors.black45,
            fontSize: 15,
            fontWeight: FontWeight.normal

        ),
      ),
    ],),
    SizedBox(height: 15,),

     Text(
      worker.discreption,
      style: TextStyle(

          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.normal

      ),
    ),

        SizedBox(height: 10,),

         Container(child:
              MaterialButton(
                minWidth: double.infinity,
                height: 30 ,
                onPressed: () => print( 'chat btn Pressed'),
                shape:RoundedRectangleBorder(
                    side: const BorderSide(
                        color:Color.fromARGB(255, 255, 154, 154)),
                    borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.white,
                child: const Text(
                  'Chat',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 154, 154),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )

  ),

    SizedBox(height: 5,),

    Container(child:
    MaterialButton(
      minWidth: double.infinity,
      height: 40 ,
      onPressed: () {print( 'comment btn Pressed');
      Navigator.of(context).pushNamed('/comment',arguments: worker);Colors.red[200];
                          print(worker.name+'pressed') ;},
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Color.fromARGB(255, 255, 154, 154)),
          borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.white,
      child: const Text(
        'Show comment',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 154, 154),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    )

    ),

    SizedBox(height: 5,),

    Container(child:
    MaterialButton(
      minWidth: double.infinity,
      height: 40 ,
      onPressed: () => print( 'booking btn Pressed'),
      shape:RoundedRectangleBorder(
          side: const BorderSide(
              color:Color.fromARGB(255, 255, 154, 154)
            ),
          borderRadius: BorderRadius.circular(15)
      ),
      color: Colors.white,
      child: const Text(
        'Booking',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 154, 154),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    )

    ),








    ]
      )
  )
  ),
],
        ),

      )
    );
  }
}