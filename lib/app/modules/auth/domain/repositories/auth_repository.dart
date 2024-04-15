
import '../entities/create_user.dart';
import '../entities/login.dart';
import '../entities/refresh.dart';
import '../entities/token.dart';
import '../entities/user.dart';

abstract class AuthRepository{
  Future<User> createUser(CreateUser user);
  Future<Token> login(Login login);
  Future<Token> refreshToken(Refresh refresh);
  Future<User> myUser();
  Future<void> forgotPassword(String email);
}