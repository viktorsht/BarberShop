import 'package:barber_shop/app/common_widgets/card_schedule.dart';
import 'package:barber_shop/app/constants/app_images.dart';
import 'package:barber_shop/app/modules/home/presentation/widgets/ads_widget.dart';
import 'package:barber_shop/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../constants/app_ads.dart';
import '../../../../utils/date_format_converter.dart';
import '../widgets/list_available_barber_shops.dart';
import '../widgets/list_available_cities.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Olá, Usuário'),
            Text(getFormattedDateFromToday(), style: const TextStyle(fontSize: 13),),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed("${AppRoutes.homeModule}${AppRoutes.about}"),
            icon: const Icon(Icons.info_outline)
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings)
          ),
        ],
      ),
      body: Padding(
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
              const ListAvailableCities(list: ['São Miguel da Baixa Grande', 'Picos', 'Ipiranga', 'Valença do Piauí','Oeiras',],),
              const SizedBox(height: 16,),
              const Text('Barbearias', style: TextStyle(fontSize: 18),),
              const ListAvailableBarberShop(list: ['Barber shop', "Barbearia visual", "Zé bola",'barber shop', "barbearia visual", "zé bola", ],)
            ],
          ),
        ),
      ),
    );
  }
}