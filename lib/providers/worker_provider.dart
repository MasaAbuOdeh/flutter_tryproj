import 'package:flutter/material.dart';
import 'package:flutter_try/models/user.dart';
import 'package:flutter_try/models/worker.dart';

class WorkerProvider extends ChangeNotifier {
  Worker _worker = Worker(id: '',
   email: '',
    name: '',
     password: '',
      phone: '',
       type: '',
       discreption: '',
       images: [],
       price: 0.0,
       location: '',
       latitude: 0.0,
       longitude: 0.0,
       statu: '',
       

        token: '');

  Worker get worker => _worker;

  void setWorker(String worker) {
    _worker = Worker.fromJson(worker);
    notifyListeners();
  }

  void setWorkerFromModel(Worker worker) {
    _worker = worker;
    notifyListeners();
  }
}