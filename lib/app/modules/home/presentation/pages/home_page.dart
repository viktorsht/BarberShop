import 'package:barber_shop/app/configs/themes/theme_controller.dart';
import 'package:barber_shop/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:barber_shop/app/modules/home/presentation/states/states_cities.dart';
import 'package:barber_shop/app/utils/common_widgets/card_schedule.dart';
import 'package:barber_shop/app/utils/constants/app_images.dart';
import 'package:barber_shop/app/modules/home/presentation/widgets/ads_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../utils/constants/app_ads.dart';
import '../../../../utils/date/date_format_converter.dart';
import '../widgets/list_available_barber_shops.dart';
import '../widgets/list_available_cities.dart';


class HomePage extends StatelessWidget {
  final HomeController controller;
  final String? name;
  const HomePage({super.key, required this.controller, required this.name});

  @override
  Widget build(BuildContext context) {

    final themeController = ThemeController();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            name == null ? const Text('Olá, Usuário') : Text('Olá, $name'),
            Text(getFormattedDateFromToday(), style: const TextStyle(fontSize: 13),),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed("${AppRoutes.homeModule}${AppRoutes.about}"),
            icon: const Icon(Icons.info_outline)
          ),
          ListenableBuilder(
            listenable: themeController,
            builder: (context, snapshot) {
              return IconButton(
                onPressed: () {
                  themeController.toggleTheme();
                  print(themeController.isDarkMode);
                },
                icon: const Icon(Icons.settings)
              );
            }
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppAds.adsList.isEmpty ? Container() : AdsWidget(publicacoes: AppAds.adsList),
                  const SizedBox(height: 16,),
                  const Text('Próximo agendamento', style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 16,),
                  CardSchedule(
                    numSchedule: '123', 
                    service: 'Corte Social', 
                    value: '30.00', 
                    time: '30',
                    date: '10/04/2024',
                    urlImage: AppImages.imageBarberShopExemploLink
                  ),
                  const SizedBox(height: 16,),
                  const Text('Cidades', style: TextStyle(fontSize: 18),),
                  ListAvailableCities(
                    controller: controller,
                    list: controller.listCities
                  ),
                  const SizedBox(height: 16,),
                  ListenableBuilder(
                    listenable: controller,
                    builder: (context, child) {
                      if(controller.state is BarberSucess){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Barbearias', style: TextStyle(fontSize: 18),),
                            ListAvailableBarberShop(
                              controller: controller,
                              list: controller.listBarberShop,
                            )
                          ],
                        );
                      }
                      if(controller.state is BarberLoading){
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}