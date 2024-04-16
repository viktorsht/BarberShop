import 'package:flutter/material.dart';

import '../../../../resources/execptions/unauthorized_exception.dart';
import '../../../auth/domain/states/logged_state.dart';
import '../../domain/entities/barber.dart';
import '../../domain/entities/city.dart';
import '../../domain/repositories/home_repository.dart';
import '../states/states_cities.dart';

class HomeController extends ChangeNotifier{
  
  final HomeRepository homeRepository;

  HomeController(this.homeRepository);

  int citySelect = -1;
  int barberShop = -1;

  UserAppState state = CitiesInitial();

  void setState(UserAppState value){
    state = value;
    notifyListeners();
  }

  selectCity(int value){
    citySelect = value;
    notifyListeners();
  }

  selectBarberShop(int value){
    barberShop = value;
    notifyListeners();
  }

  List<City> listCities = [];
  List<Barber> listBarberShop = [];

  void setListCities(value){
    listCities = value;
    notifyListeners();
  }

  void setListBarberShop(value){
    listBarberShop = value;
    notifyListeners();
  }


  Future<void> getCity() async{
    setState(CitiesLoading());
    try {
      final list = await homeRepository.getCity();
      setListCities(list);
      setState(CitiesSucess());
    } catch (e) {
      e is UnauthorizedException ? setState(NotLoggedIn()) : setState(CitiesError());
    }
  }

  Future<void> getBarberShop() async{
    setState(BarberLoading());
    try {
      final list = citySelect != -1 
        ? await homeRepository.getBarberShop(citySelect) 
        : await homeRepository.getBarberShop();
      setListBarberShop(list);
      setState(BarberSucess());
    } catch (e) {
      e is UnauthorizedException ? setState(NotLoggedIn()) : setState(BarberError());
    }
  }


}