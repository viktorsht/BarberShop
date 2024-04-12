import 'package:barber_shop/app/common_widgets/card_schedule.dart';
import 'package:barber_shop/app/modules/home/presentation/widgets/ads_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/date_format_converter.dart';
import '../widgets/list_available_barber_shops.dart';
import '../widgets/list_available_cities.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<String> adsList = [
      "https://www.adsoftheworld.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMW1LQVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--b2ce16b27f31a78086e08e2788ec2937783b4fe0/thumbnail_134752",
      "https://img.freepik.com/premium-psd/barber-shop-landing-page-template_23-2148681402.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLyuqUciwAGhOCvVh5iRvzbZDhohTRKxjQka9h3MrRmiP_W4quXK0WuJE9Os-bzYrYbyo&usqp=CAU",
      "https://img.freepik.com/premium-psd/barber-shop-landing-page-template_23-2148681402.jpg",
      // Adicione mais publicações conforme necessário
    ];

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdsWidget(publicacoes: adsList),
              const SizedBox(height: 16,),
              const Text('Próximo agendamento', style: TextStyle(fontSize: 18),),
              const SizedBox(height: 16,),
              const CardSchedule(numSchedule: '123', service: 'Corte Social', value: '30.00', time: '30', date: '10/04/2024', urlImage: '', ),
              const SizedBox(height: 16,),
              const Text('Cidades', style: TextStyle(fontSize: 18),),
              const ListAvailableCities(list: ['São Miguel da Baixa Grande', 'Picos', 'Ipiranga', 'Valença do Piauí','Oeiras',],),
              const SizedBox(height: 16,),
              const Text('Barbearias', style: TextStyle(fontSize: 18),),
              const ListAvailableBarberShop(list: ['barber shop', "barbearia visual", "zé bola",'barber shop', "barbearia visual", "zé bola", ],)
            ],
          ),
        ),
      ),
    );
  }
}