import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_try/ucan/layout/todo_layoutcontroller.dart';
import 'package:flutter_try/ucan/shared/componets/componets.dart';

class DoneEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoLayoutController>(
      init: Get.find<TodoLayoutController>(),
      builder: (todoController) => eventsBuilder(
          tasks: todoController.doneeventList,
          message: "No Finished Events",
          svgimage: "https://cdn-icons-png.flaticon.com/512/1632/1632670.png",
          context: context),
    );
  }
}