import '../../../domain/entities/user.dart';

abstract class CreateUserState {}

final class CreateUserInitial extends CreateUserState {}

class CreateUserError extends CreateUserState {
  final String error;

  CreateUserError({required this.error});
}

class CreateUserSucess extends CreateUserState {
  final User data;

  CreateUserSucess({required this.data});
}

class CreateUserLoading extends CreateUserState {
  CreateUserLoading();
}