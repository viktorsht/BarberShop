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

  Future<UserAppState> isLogged() async {
    String? tokenSaved = await tokenRepository.getToken();
    if(tokenSaved == null){
      return NotLoggedIn();
    }
    try{
      final user = await authRepository.myUser();
      if(user.id != null){
        final token = await authRepository.refreshToken(Token(access: tokenSaved));
        if(token.access == null){
          return NotLoggedIn();
        }
        await tokenRepository.saveToken(token.access!);
        return LoggedIn();
      }
      return NotLoggedIn();
    }
    catch (e){
      if(e is UnauthorizedException){
        return NotLoggedIn();
      }
    }
    return NotConnectIn();
  }

}
