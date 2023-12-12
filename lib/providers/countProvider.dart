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

  void displayDialog(BuildContext context){
    showDialog(context: context,barrierDismissible: false, builder: (context){
      return const Center(child:
      CircularProgressIndicator(),);
    });

    Future.delayed(const Duration(seconds: 10),(){
      Navigator.pop(context);
    });
  }

}