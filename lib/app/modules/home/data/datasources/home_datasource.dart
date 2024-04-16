import '../../domain/entities/city.dart';

abstract class HomeDatasource{
  Future<List<City>> getCity(String token);
}