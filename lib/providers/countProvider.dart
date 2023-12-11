import 'package:flutter/material.dart';

class counterProvider with ChangeNotifier{
  int _count = 0;
  int get getCounter => _count;
  bool load = false;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement(){
    _count--;
    notifyListeners();
  }
  void isLoading(){
    load = !load;
  }

}