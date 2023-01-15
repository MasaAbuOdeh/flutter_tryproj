import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/common/widgets/custom_button.dart';
import 'package:flutter_try/common/widgets/custom_textfield.dart';
import 'package:flutter_try/constants/utils.dart';
import 'package:flutter_try/services/business_info.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';

import '../providers/worker_provider.dart';

class business_home extends StatefulWidget { 
  const business_home({
    Key? key
  }) :super (key:key);
  @override
  _business_homeState createState()=> _business_homeState();
}
class _business_homeState extends State<business_home>{
   final TextEditingController NameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController locationlatController = TextEditingController();
  final TextEditingController locationlongController = TextEditingController();
  
  List<File> images =[];
  final business_info info = business_info();
  final _addProductFormKey = GlobalKey<FormState>();
  var trr;

  void dispose() {
    super.dispose();
    NameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    locationController.dispose();
    locationlatController.dispose();
    locationlongController.dispose();
  }
  


  void sendinfo (){
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty){
      info.sendinfo(context: context,
       name: NameController.text,
        discreption: descriptionController.text, 
        images: images,
         price: double.parse(priceController.text), 
         location: locationController.text,
         latitude: double.parse(locationlatController.text),
         longitude:double.parse(locationlongController.text) );

 
    }

  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final worker = Provider.of<WorkerProvider>(context).worker;
    trr=worker;
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    :
                GestureDetector(
                  onTap: selectImages,
                  child:DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10.4),
                  dashPattern: const [10, 4],
                  strokeCap: StrokeCap.round,
                  child:Container(
                    width: double.infinity ,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.folder_open,
                          size: 40,
                        ),
                        const SizedBox(height: 15,),
                        Text("select images",
                        style: TextStyle(fontSize: 15,color:Colors.grey.shade400),)
                      ],
                    ),
                    )
                    ))
                ,
                const SizedBox(height:30),
                 CustomTextField(
                  controller: NameController,
                  hintText: 'Name',
                  sheef: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                  sheef: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: priceController,
                  hintText: 'Price',
                  sheef: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: locationController,
                  hintText: 'Location',
                  sheef: false,
                ),
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: locationlatController,
                  hintText: 'latitude for locatin on map',
                  sheef: false,
                ),
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: locationlongController,
                  hintText: 'longitude for location on map',
                  sheef: false,
                ),
                const SizedBox(height: 20),
                CustomButton(text: "Add",
                 onTap: (){
                 showSnackBar(context, 'info send successfully ! it will be shown in the user side',);
                  //sendinfo();
                 })
              ]),
               ),
              ))
    );
    throw UnimplementedError();
  }
}