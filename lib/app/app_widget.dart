import 'package:barber_shop/app/configs/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppWidget extends StatelessWidget{
  const AppWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = ThemeController();
    return ListenableBuilder(
      listenable: controller,
      builder: (context, snapshot) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: Modular.routerConfig,
          theme: controller.isDarkMode ? ThemeData.dark() : ThemeData.light(),
        );
      }
    );
  }

}
