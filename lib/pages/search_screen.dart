import 'package:flutter/material.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/services/search_services.dart';
import 'package:flutter_try/widget/loader.dart';

class search_screen extends StatefulWidget{
  const search_screen({super.key});
  
  @override
  _search_screenState createState() =>_search_screenState(); 
  
}
class _search_screenState extends State<search_screen>{
  final search_services searchq=search_services();
  List<Worker>? workerssearch;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    final String? ss =ModalRoute.of(context)!.settings.arguments as String?;
    
    searchset() async{
       workerssearch= await searchq.search(context, ss!) ;

       setState(() {
      
    });
    }

    
  

  
  

return Scaffold(
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
                workerssearch![0].name,
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 116, 116),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),

),
  body: workerssearch == null
          ? const Loader()
          : Column(
              children: [
                //const AddressBox(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: workerssearch!.length,
                    itemBuilder: (context, index) {
                      return Container(

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
                    image: NetworkImage(workerssearch![index].images[0])
                     )
                ) ,
              ),

              ]),
                )
                ;
                    }
                  ),),])
);

  }}