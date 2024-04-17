import 'package:barber_shop/app/modules/auth/data/datasources/auth_datasources.dart';
import '../../../../resources/execptions/unauthorized_exception.dart';
import '../../../../external/api/headers.dart';
import '../../../../external/http/http_client.dart';
import '../../domain/entities/create_user.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/token.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/token_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  
  final ClientHttp service;
  final Headers headers;
  final TokenRepository tokenRepository;
  final AuthDataSources authDataSources;

  AuthRepositoryImpl(this.service, this.headers, this.tokenRepository, this.authDataSources);

  @override
  Future<User> createUser(CreateUser user) async {
    try {
      final userResponse = await authDataSources.createUser(user);
      return userResponse;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Token> login(Login login) async {
    try {
      final token = await authDataSources.login(login);
      return token;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Token> refreshToken(Token token) async {
    try {
      return await authDataSources.refreshToken(token);
    } catch (e) {
      throw Exception(e);
    }
  }
  
  @override
  Future<User> myUser() async {
    try {
      return await authDataSources.myUser();
    } catch (e) {
      if(e is UnauthorizedException){
        rethrow;
      }
      else{
        throw Exception(e);
      }
    }
  }
  
  @override
  Future<void> forgotPassword(String email) async {
    try {
      await authDataSources.forgotPassword(email);
    } catch (e) {
      throw Exception(e);
    }
  }
}