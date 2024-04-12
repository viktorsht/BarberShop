import 'package:barber_shop/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import '../../external/api/headers.dart';
import '../../external/http/http_client.dart';
import '../../external/http/http_client_impl.dart';
import '../../routes/app_routes.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/token_repository.dart';
import 'presentation/createUser/controller/create_user_controller.dart';
import 'presentation/createUser/pages/create_user_page.dart';
import 'presentation/login/controller/login_controller.dart';
import 'presentation/login/pages/login_page.dart';
import 'presentation/profile/controller/profile_controller.dart';
import 'presentation/profile/pages/profile_page.dart';
import 'repositories/auth_repository_impl.dart';
import 'repositories/token_repository_impl.dart';

class AuthModule extends Module {

  @override
  void binds(Injector i) {
    i.add<AuthRepository>(AuthRepositoryImpl.new);
    i.addSingleton<ClientHttp>(ClientHttpImpl.new);
    i.addInstance(Client());
    i.add<Headers>(HeadersApi.new);
    i.add<CreateUserController>(CreateUserController.new);
    i.add<LoginController>(LoginController.new);
    i.add(ProfileController.new);
    i.add<TokenRepository>(TokenRepositoryImpl.new);
  }

  @override
  void routes(r){
    r.child(AppRoutes.root, child: (context) => LoginPage(controller: Modular.get<LoginController>(),),);
    r.child(AppRoutes.createUser, child: (context) => CreateUserPage(controller: Modular.get<CreateUserController>(),),);
    r.child(AppRoutes.profile, child: (context) => ProfilePage(controller: Modular.get<ProfileController>(),),);
  }

  @override
  List<Module> get imports => [AppModule()];
}