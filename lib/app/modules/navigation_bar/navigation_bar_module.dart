import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/app_routes.dart';

class NavigationBarModule extends Module{
  @override
  void binds(i) {
  }

  @override
  void routes(r) {
    r.child(AppRoutes.root, child: (context) => const NavigationBarPage());
  }
}