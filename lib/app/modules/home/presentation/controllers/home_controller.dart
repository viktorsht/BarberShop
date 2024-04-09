import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{

  int citySelect = -1;

  selectCity(int value){
    citySelect = value;
    notifyListeners();
  }
}