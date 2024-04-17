import 'package:flutter/material.dart';

import '../../resources/execptions/unauthorized_exception.dart';
import '../auth/domain/entities/token.dart';
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
    print("Token Salvo: $tokenSaved");
    if(tokenSaved == null){
      setState(NotLoggedIn());
      return NotLoggedIn();
    }
    try{
      final user = await authRepository.myUser();
      print(user.id);
      if(user.id != null){
        final token = await authRepository.refreshToken(Token(access: tokenSaved));
        print(token.access);
        if(token.access == null){
          setState(NotLoggedIn());
          return NotLoggedIn();
        }
        await tokenRepository.saveToken(token.access!);
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
