import 'package:barber_shop/app/common_widgets/card_schedule.dart';
import 'package:flutter/material.dart';

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
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Próximo agendamento', style: TextStyle(fontSize: 18),),
            CardSchedule(numSchedule: '123', service: 'Corte Social', value: '30.00', time: '30', date: '10/04/2024', urlImage: '', ),
            SizedBox(height: 16,),
            Text('Cidades', style: TextStyle(fontSize: 18),),
            ListAvailableCities(list: ['inhuma', 'Picos', 'inhuma', 'inhuma','inhuma',],),
            SizedBox(height: 16,),
            Text('Barbearias', style: TextStyle(fontSize: 18),),
            ListAvailableBarberShop(list: ['barber shop', "barbearia visual", "zé bola",'barber shop', "barbearia visual", "zé bola", ],)
          ],
        ),
      ),
    );
  }
}