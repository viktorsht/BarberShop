import 'package:barber_shop/app/modules/home/domain/entities/barber.dart';

import '../entities/city.dart';

abstract class HomeRepository{
  Future<List<City>> getCity();
  Future<List<Barber>> getBarberShop(int id);
}