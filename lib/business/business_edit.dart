
import 'package:flutter/material.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:provider/provider.dart';

class business_edit extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final worker = Provider.of<WorkerProvider>(context).worker;
    return Container(
      child: Center(child: Text(worker.name)),
    );
    throw UnimplementedError();
  }

}