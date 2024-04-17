import 'package:barber_shop/app/configs/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'configs/themes/app_themes.dart';


class AppWidget extends StatelessWidget{
  const AppWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (context, controller, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: Modular.routerConfig,
            theme: controller.isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
          );
        }
      )
    );
  }
}
