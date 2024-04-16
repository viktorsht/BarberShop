import 'package:flutter/material.dart';

import '../../../domain/entities/login.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/repositories/token_repository.dart';
import 'login_state.dart';

class LoginController extends ChangeNotifier{

  final AuthRepository authRepository;
  final TokenRepository tokenRepository;

  LoginController(this.authRepository, this.tokenRepository);


  LoginState state = LoginInitial();

  void setState(LoginState value){
    state = value;
    notifyListeners();
  }

  Future<void> login(Login entity) async {
    setState(LoginLoading());
    notifyListeners();
    try{
      final token = await authRepository.login(entity);
      if(token.access == null){
        setState(LoginError());
        notifyListeners();
      }
      else{
        setState(LoginSucess());
        tokenRepository.saveToken(token.access.toString());
        notifyListeners();
      }
    }
    catch (e){
      setState(LoginError());
      notifyListeners();
    }
  }


}