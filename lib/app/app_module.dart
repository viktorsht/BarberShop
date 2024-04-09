import 'package:barber_shop/app/modules/navigation_bar/navigation_bar_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import 'external/http/http_client.dart';
import 'external/http/http_client_impl.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';
import 'routes/app_routes.dart';

class AppModule extends Module {

  @override
  void exportedBinds(Injector i) {
    i.add<ClientHttp>(ClientHttpImpl.new);
    i.addInstance(Client());
  }

  @override
  void routes(r) {
    r.child(AppRoutes.root, child: (context) => const SplashPage());
    //r.module(AppRoutes.authModule, module: AuthModule());
    r.module(AppRoutes.homeModule, module: HomeModule());
    r.module(AppRoutes.navigationModule, module: NavigationBarModule());
    //r.module(AppRoutes.scheduleModule, module: ScheduleModule());
    //r.module(AppRoutes.myScheduleModule, module: MyScheduleModule());
  }
}