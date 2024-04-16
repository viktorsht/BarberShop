
import 'package:barber_shop/app/modules/home/data/datasources/home_datasource.dart';
import 'package:barber_shop/app/modules/home/domain/entities/barber.dart';
import 'package:barber_shop/app/modules/home/domain/entities/city.dart';

import '../../../../resources/execptions/unauthorized_exception.dart';
import '../../../auth/domain/repositories/token_repository.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{

  final HomeDatasource homeDatasource;
  final TokenRepository tokenRepository;


  HomeRepositoryImpl(this.homeDatasource, this.tokenRepository);
  
  @override
  Future<List<City>> getCity() async {
    try {
      String? token = await tokenRepository.getToken();
      if(token == null){
        throw UnauthorizedException('Não logado');
      }
      final cities = await homeDatasource.getCity(token);
      return cities;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Barber>> getBarberShop([int? id]) async {
    try {
      String? token = await tokenRepository.getToken();
      if(token == null){
        throw UnauthorizedException('Não logado');
      }
      if(id == null){
        return await homeDatasource.getBarberShop(token);
      }
      return await homeDatasource.getBarberShop(token, id);
    } catch (e) {
      throw Exception(e);
    }
  }

}