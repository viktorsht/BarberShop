import 'package:barber_shop/app/app_module.dart';
import 'package:barber_shop/app/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/app_routes.dart';
import 'presentation/pages/navigation_bar_page.dart';

class NavigationBarModule extends Module{
  @override
  List<Module> get imports => [AppModule(), AuthModule()];
  
  @override
  void routes(r) {
    r.child(AppRoutes.root, child: (context) => const NavigationBarPage());
  }

}