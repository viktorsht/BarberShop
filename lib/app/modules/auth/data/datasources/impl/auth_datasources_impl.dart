import 'dart:convert';

import '../../../../../external/api/headers.dart';
import '../../../../../external/api/routes.dart';
import '../../../../../external/http/http_client.dart';
import '../../../../../resources/execptions/unauthorized_exception.dart';
import '../../../domain/entities/create_user.dart';
import '../../../domain/entities/login.dart';
import '../../../domain/entities/refresh.dart';
import '../../../domain/entities/token.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/repositories/token_repository.dart';
import '../auth_datasources.dart';

class AuthDataSourcesImpl implements AuthDataSources{
  
  final ClientHttp service;
  final Headers headers;
  final TokenRepository tokenRepository;


  AuthDataSourcesImpl(this.service, this.headers, this.tokenRepository);

  @override
  Future<User> createUser(CreateUser user) async {
    final response = await service.post(RoutesApi.createUser, HeadersApi.getHeaders(), user.toJson());
    final json = jsonDecode(response.body);
    return User.fromJson(json);
  }

  @override
  Future<Token> login(Login login) async {
    final response = await service.post(RoutesApi.login, HeadersApi.getHeaders(), login.toJson());
    final json = jsonDecode(response.body);
    return Token.fromJson(json);
  }

  @override
  Future<User> myUser() async {
    String? token = await tokenRepository.getToken();
    if(token == null){
      throw UnauthorizedException('Você não está logado');
    }
    final response = await service.get(RoutesApi.myUser, headers.headersToken(token));
    if(response.statusCode == 401){
      throw UnauthorizedException('Você não está logado');
    }
    final json = jsonDecode(response.body);
    return User.fromJson(json);
  }

  @override
  Future<Token> refreshToken(Refresh refresh) async {
    final response = await service.post(RoutesApi.refresh, HeadersApi.getHeaders(), refresh.toJson());
    final json = jsonDecode(response.body);
    return Token.fromJson(json);
  }

}