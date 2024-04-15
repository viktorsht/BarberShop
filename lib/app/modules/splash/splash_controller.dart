import 'package:flutter/material.dart';

import '../../resources/execptions/unauthorized_exception.dart';
import '../auth/domain/entities/refresh.dart';
import '../auth/domain/repositories/auth_repository.dart';
import '../auth/domain/repositories/token_repository.dart';
import '../auth/domain/states/logged_state.dart';

class SplashController extends ChangeNotifier{

  final TokenRepository tokenRepository;
  final AuthRepository authRepository;

  SplashController(this.tokenRepository, this.authRepository);

  UserAppState state = NotLoggedIn();

  void setState(UserAppState value) {
    state = value;
    notifyListeners();
  }

  Future<UserAppState> isLogged() async {
    String? tokenSaved = await tokenRepository.getToken();
    String? refreshTokenSaved = await tokenRepository.getRefreshToken();
    if(tokenSaved == null || refreshTokenSaved == null){
      setState(NotLoggedIn());
      return NotLoggedIn();
    }
    try{
      final user = await authRepository.myUser();
      if(user.id != -1){
        final refresh = Refresh(refresh: refreshTokenSaved);
        final token = await authRepository.refreshToken(refresh);
        if(token.access == null || token.refresh == null){
          setState(NotLoggedIn());
          return NotLoggedIn();
        }
        await tokenRepository.saveToken(token.access!);
        await tokenRepository.saveRefreshToken(token.refresh!);
        setState(LoggedIn());
        return LoggedIn();
      }
      return NotLoggedIn();
    }
    catch (e){
      if(e is UnauthorizedException){
        setState(NotLoggedIn());
        return NotLoggedIn();
      }
      setState(NotConnectIn());
    }
    return NotConnectIn();
  }

}
