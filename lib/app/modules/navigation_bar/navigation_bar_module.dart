import 'package:barber_shop/app/app_module.dart';
import 'package:barber_shop/app/modules/auth/auth_module.dart';
import 'package:barber_shop/app/modules/auth/presentation/profile/controller/profile_controller.dart';
import 'package:barber_shop/app/modules/home/home_module.dart';
import 'package:barber_shop/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../configs/routes/app_routes.dart';
import '../home/data/datasources/home_datasource.dart';
import '../home/data/datasources/impl/home_datasource_impl.dart';
import '../home/data/repositories/home_repository_impl.dart';
import '../home/domain/repositories/home_repository.dart';
import 'presentation/pages/navigation_bar_page.dart';

class NavigationBarModule extends Module{
  
  @override
  List<Module> get imports => [
    CoreModule(),
    AuthModule(), 
    HomeModule()
  ];

  @override
  void binds(Injector i) {
    i.add<HomeDatasource>(HomeDatasourceImpl.new);
    i.add<HomeRepository>(HomeRepositoryImpl.new);
    i.add<HomeController>(HomeController.new);
  }
  
  @override
  void routes(r) {
    r.child(AppRoutes.root, child: (context) => NavigationBarPage(
        homeController: Modular.get<HomeController>(),
        profileController: Modular.get<ProfileController>(),
      )
    );
  }

}