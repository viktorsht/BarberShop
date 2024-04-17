import '../../domain/entities/create_user.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/token.dart';
import '../../domain/entities/user.dart';

abstract class AuthDataSources {
  Future<User> createUser(CreateUser user);
  Future<Token> login(Login login);
  Future<Token> refreshToken(Token refresh);
  Future<User> myUser();
  Future<void> forgotPassword(String email);

}