import 'package:flutter/material.dart';

import '../../../domain/repositories/auth_repository.dart';
import 'forgot_password_state.dart';

class ForgotPasswordController extends ChangeNotifier{

  final AuthRepository authRepository;

  ForgotPasswordController(this.authRepository);

  ForgotState state = ForgotInitial();

  Future<void> forgotPassword(String email) async {
    state = ForgotLoading();
    notifyListeners();
    try{
      //final data = await authRepository.forgotPassword(email);
      state = ForgotSucess();
      notifyListeners();
    }
    catch (e){
      state = ForgotError();
      notifyListeners();
    }
  }
}