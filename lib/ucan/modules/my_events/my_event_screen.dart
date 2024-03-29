import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_try/ucan/layout/todo_layoutcontroller.dart';
import 'package:flutter_try/ucan/shared/componets/componets.dart';
class MyEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoLayoutController>(
      init: Get.find<TodoLayoutController>(),
      builder: (todoController) => eventsBuilder(
        tasks: todoController.neweventList,
        context: context,
        message: "No Events yet",
        svgimage: "assets/new_task_svg.svg",
      ),
    );
  }
}