import 'package:barber_shop/app/modules/home/presentation/pages/about/about_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../configs/routes/app_routes.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module{
  @override
  void binds(i) {
  }

  @override
  void routes(r) {
    r.child(AppRoutes.root, child: (context) => const HomePage());
    r.child(AppRoutes.about, child: (context) => const AboutPage());
  }
}