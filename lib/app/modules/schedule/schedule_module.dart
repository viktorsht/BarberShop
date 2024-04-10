import 'package:barber_shop/app/app_module.dart';
import 'package:barber_shop/app/modules/schedule/presentation/pages/schedule_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/app_routes.dart';
import 'presentation/pages/services_page.dart';

class ScheduleModule extends Module{
  @override
  void binds(Injector i) {
    //i.add<ClientHttp>(ClientHttpImpl.new);
    //i.addInstance(Client());
  }

  @override
  void routes(r) {
    r.child(AppRoutes.root, child: (context) => const ServicesPage());
    r.child(AppRoutes.schedule, child: (context) => const SchedulePage());
  }

  @override
  List<Module> get imports => [AppModule()];
}