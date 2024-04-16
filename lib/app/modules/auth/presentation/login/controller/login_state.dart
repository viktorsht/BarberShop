
abstract class LoginState {}

final class LoginInitial extends LoginState {}

class LoginError extends LoginState {}

class LoginSucess extends LoginState {}

class LoginLoading extends LoginState {}