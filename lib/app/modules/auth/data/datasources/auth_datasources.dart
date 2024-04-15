import '../../domain/entities/create_user.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/refresh.dart';
import '../../domain/entities/token.dart';
import '../../domain/entities/user.dart';

abstract class AuthDataSources {
  Future<User> createUser(CreateUser user);
  Future<Token> login(Login login);
  Future<Token> refreshToken(Refresh refresh);
  Future<User> myUser();
}