import 'package:barber_shop/app/app_module.dart';
import 'package:barber_shop/app/modules/auth/auth_module.dart';
import 'package:barber_shop/app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:barber_shop/app/modules/home/presentation/pages/about/about_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../configs/routes/app_routes.dart';
import 'data/datasources/home_datasource.dart';
import 'data/datasources/impl/home_datasource_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'presentation/controllers/home_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module{
  @override
  List<Module> get imports => [CoreModule(), AuthModule()];

  @override
  void exportedBinds(i) {
    i.add<HomeDatasource>(HomeDatasourceImpl.new);
    i.add<HomeRepository>(HomeRepositoryImpl.new);
    i.add<HomeController>(HomeController.new);
  }

  @override
  void routes(r) {
    r.child(AppRoutes.root, child: (context) => HomePage(
        controller: Modular.get<HomeController>(),
        name: r.args.data['name']
      )
    );
    r.child(AppRoutes.about, child: (context) => const AboutPage());
  }
}