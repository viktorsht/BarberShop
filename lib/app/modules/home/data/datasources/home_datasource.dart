import 'package:barber_shop/app/modules/home/domain/entities/barber.dart';

import '../../domain/entities/city.dart';

abstract class HomeDatasource{
  Future<List<City>> getCity(String token);
  Future<List<Barber>> getBarberShop(String token, int id);
}