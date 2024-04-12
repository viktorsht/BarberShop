import 'package:flutter/material.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/states/logged_state.dart';
import 'profile_state.dart';

class ProfileController extends ChangeNotifier{

  final AuthRepository authRepository;

  ProfileController(this.authRepository);

  UserAppState state = ProfileInitial();

  void setState(UserAppState value){
    state = value;
    notifyListeners();
  }

  var user = User();


  void setUser(User value){
    user = value;
    notifyListeners();
  }

  Future<void> profile() async {
    setState(ProfileLoading());
    try {
      final response = await authRepository.myUser();
      setUser(response);
      setState(ProfileSucess());
    } catch (e) {
      setState(ProfileError());
    }
  }
}