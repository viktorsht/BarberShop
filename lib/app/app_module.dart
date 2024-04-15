import 'package:barber_shop/app/modules/navigation_bar/navigation_bar_module.dart';
import 'package:barber_shop/app/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import 'configs/routes/app_routes.dart';
import 'external/api/headers.dart';
import 'external/http/http_client.dart';
import 'external/http/http_client_impl.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/schedule/schedule_module.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<ClientHttp>(ClientHttpImpl.new);
    i.addInstance(Client());
    i.add<Headers>(HeadersApi.new);
  }
}

class AppModule extends Module {

  @override
  List<Module> get imports => [CoreModule(), AuthModule()];

  @override
  void routes(r) {
    r.module(AppRoutes.root, module: SplashModule());
    r.module(AppRoutes.authModule, module: AuthModule());
    r.module(AppRoutes.homeModule, module: HomeModule());
    r.module(AppRoutes.navigationModule, module: NavigationBarModule());
    r.module(AppRoutes.scheduleModule, module: ScheduleModule());
    //r.module(AppRoutes.myScheduleModule, module: MyScheduleModule());
  }
}