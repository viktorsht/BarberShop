import 'package:flutter/material.dart';
import '../../../domain/entities/create_user.dart';
import '../../../domain/repositories/auth_repository.dart';
import 'create_user_state.dart';

class CreateUserController extends ChangeNotifier{

  final AuthRepository authRepository;

  CreateUserController(this.authRepository);

  CreateUserState state = CreateUserInitial();

  Future<void> createUser(CreateUser entity) async {
    state = CreateUserLoading();
    notifyListeners();
    try{
      final data = await authRepository.createUser(entity);
      state = CreateUserSucess(data: data);
      notifyListeners();
    }
    catch (e){
      state = CreateUserError(error: e.toString());
      notifyListeners();
    }
  }
}