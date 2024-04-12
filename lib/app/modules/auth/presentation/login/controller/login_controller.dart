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

  Future<void> login(Login entity) async {
    state = LoginLoading();
    notifyListeners();
    try{
      final data = await authRepository.login(entity);
      if(data.access == null || data.refresh == null){
        state = LoginError(error: 'Erro no login');
        notifyListeners();
      }
      else{
        state = LoginSucess(data: data);
        tokenRepository.saveToken(data.access.toString());
        tokenRepository.saveRefreshToken(data.refresh.toString());
        notifyListeners();
      }
    }
    catch (e){
      state = LoginError(error: e.toString());
      notifyListeners();
    }
  }


}