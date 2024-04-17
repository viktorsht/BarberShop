import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../configs/routes/app_routes.dart';
import '../../utils/constants/app_images.dart';
import '../auth/domain/states/logged_state.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;
  const SplashPage({super.key, required this.controller});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
   @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        final state = await widget.controller.isLogged();
        if(state is LoggedIn){
          Modular.to.navigate(AppRoutes.navigationModule);
        }
        if(state is NotLoggedIn){
          Modular.to.navigate(AppRoutes.authModule);
        }
        if(state is NotConnectIn) {
          //Modular.to.navigate(AppRoutes.notInternet);
          Modular.to.navigate(AppRoutes.authModule);
        }
      },
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(child: Image.asset(AppImages.logo)),
    );
  }
}