import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/app_routes.dart';
import 'presentation/home_page.dart';

class HomeModule extends Module{
  @override
  void binds(Injector i) {
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.root, child: (context) => const HomePage());
  }
}