
import 'dart:convert';

import 'package:barber_shop/app/external/api/routes.dart';
import 'package:barber_shop/app/modules/home/domain/entities/barber.dart';
import 'package:barber_shop/app/modules/home/domain/entities/city.dart';

import '../../../../../external/api/headers.dart';
import '../../../../../external/http/http_client.dart';
import '../home_datasource.dart';

class HomeDatasourceImpl implements HomeDatasource{

  final ClientHttp service;
  final Headers headers;

  HomeDatasourceImpl(this.service, this.headers);

  @override
  Future<List<City>> getCity(String token) async {
    final response = await service.get(RoutesApi.cities, headers.headersToken(token));
    final json = jsonDecode(response.body) as List;
    return json.map((e) => City.fromJson(e)).toList();
  }

  @override
  Future<List<Barber>> getBarberShop(String token, [int? id]) async {
    final url = id != null ? RoutesApi.branchesForCity + id.toString() : RoutesApi.branches;
    final response = await service.get(url, headers.headersToken(token));
    final json = jsonDecode(response.body) as List;
    return json.map((e) => Barber.fromJson(e)).toList();
  }

}