import 'dart:convert';


import '../../../execptions/unauthorized_exception.dart';
import '../../../external/api/headers.dart';
import '../../../external/api/routes.dart';
import '../../../external/http/http_client.dart';
import '../domain/entities/create_user.dart';
import '../domain/entities/login.dart';
import '../domain/entities/refresh.dart';
import '../domain/entities/token.dart';
import '../domain/entities/user.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/token_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  
  final ClientHttp service;
  final Headers headers;
  final TokenRepository tokenRepository;

  AuthRepositoryImpl(this.service, this.headers, this.tokenRepository);

  @override
  Future<User> createUser(CreateUser user) async {
    try {
      final response = await service.post(RoutesApi.createUser, HeadersApi.getHeaders(), user.toJson());
      final json = jsonDecode(response.body);
      return User.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Token> login(Login login) async {
    try {
      final response = await service.post(RoutesApi.login, HeadersApi.getHeaders(), login.toJson());
      final json = jsonDecode(response.body);
      return Token.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Token> refreshToken(Refresh refresh) async {
    try {
      final response = await service.post(RoutesApi.refresh, HeadersApi.getHeaders(), refresh.toJson());
      final json = jsonDecode(response.body);
      return Token.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }
  
  @override
  Future<User> myUser() async {
    try {
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
    } catch (e) {
      if(e is UnauthorizedException){
        rethrow;
      }
      else{
        throw Exception(e);
      }
    }
  }
}