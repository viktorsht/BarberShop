import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../../configs/routes/app_routes.dart';
import '../auth/auth_module.dart';
import 'splash_controller.dart';
import 'splash_page.dart';

class SplashModule extends Module{

  @override
  List<Module> get imports => [CoreModule(), AuthModule()];
  
  @override
  void binds(i) {
    i.add(SplashController.new);
  }

  @override
  void routes(r){
    r.child(AppRoutes.root, child: (context) => SplashPage(
      controller: Modular.get<SplashController>(),),);

    //r.child(AppRoutes.notInternet, child: (context) => const NoInternetPage());
  }
}