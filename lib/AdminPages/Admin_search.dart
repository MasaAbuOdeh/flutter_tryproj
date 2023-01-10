import 'package:flutter/material.dart';
import 'package:flutter_try/constants/global_variables.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/services/search_services.dart';
import 'package:flutter_try/widget/loader.dart';

class search_screen extends StatefulWidget{
  final String SearchQuery ;
  const search_screen({super.key,
  required this.SearchQuery});
  
  @override
  _search_screenState createState() =>_search_screenState(); 
  
}
class _search_screenState extends State<search_screen>{
  List<Worker>? workerssearch;
  final search_services searchq=search_services();


  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    searchset();
    
  }
  searchset() async{
       workerssearch= await searchq.searchAdmin(context, widget.SearchQuery) ;

       setState(() {
      
    });
    }
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
   /* final String? ss =ModalRoute.of(context)!.settings.arguments as String?;
    
    searchset() async{
       workerssearch= await searchq.search(context, ss!) ;

       setState(() {
      
    });
    }*/

    
  

  
  

//return workerssearch==null? const Loader(): Scaffold(
 // body: Center(child: Text(widget.SearchQuery)),
 /* appBar: PreferredSize(
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
                  ),),])*/
//);
return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navegatetosearchscreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search ',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25),
              ),
            ],
          ),
        ),
      ),
      body: workerssearch == null
          ? const Loader()
          : Column(
              children: [
               // const AddressBox(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: workerssearch!.length,
                    itemBuilder: (context, index) {
                      
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Detail',arguments: workerssearch![index]);Colors.red[200];
                          print(workerssearch![index].name+'pressed');
                          
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
                    image: NetworkImage(workerssearch![index].images[0].isEmpty? "https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg":workerssearch![index].images[0])
                     )
                ) ,
              ),
              SizedBox(height: 10,),
              
              //Text(workerdata.name, style: TextStyle(fontSize: 35),),
              //SizedBox(height: 5,),
              Row(
                children: [
                  Text(workerssearch![index].name, style: TextStyle(fontSize: 20),),
                  SizedBox(width: 45,),
             
                ],
              ),
              SizedBox(height: 5,),
              Text(workerssearch![index].price==null?"":'\$${workerssearch![index].price}', style: TextStyle(fontSize: 20),),
              
              


            ],
          ),
        ),
        
      ) 
    ;
                    
                    },
                  ),
                ),
              ],
            ),
    );

  }}