import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/common/widgets/custom_button.dart';
import 'package:flutter_try/common/widgets/custom_textfield.dart';
import 'package:flutter_try/constants/utils.dart';
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
  List<File> images =[];

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
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
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: priceController,
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: locationController,
                  hintText: 'Location',
                ),
                const SizedBox(height: 20),
                CustomButton(text: "Add",
                 onTap: (){})
              ]),
               ),
              ))
    );
    throw UnimplementedError();
  }
}