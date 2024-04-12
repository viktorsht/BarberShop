import '../../../domain/entities/token.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

class LoginError extends LoginState {
  final String error;

  LoginError({required this.error});
}

class LoginSucess extends LoginState {
  final Token data;

  LoginSucess({required this.data});
}

class LoginLoading extends LoginState {
  LoginLoading();
}