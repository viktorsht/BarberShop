import 'package:flutter/material.dart';

class ScheduleController extends ChangeNotifier{

  int hourSelect = -1;
  int barberMan = -1;

  selectHours(int value){
    hourSelect = value;
    notifyListeners();
  }

  selectBarberMan(int value){
    barberMan = value;
    notifyListeners();
  }
}