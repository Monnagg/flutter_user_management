import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int count = 0;

  //int get count => _count;
  void increment() {
    count++;
    notifyListeners();
  }
}
