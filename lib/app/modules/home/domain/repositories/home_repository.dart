import '../entities/city.dart';

abstract class HomeRepository{
  Future<List<City>> getCity();
}