import 'package:barber_shop/app/constants/app_images.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/card_schedule.dart';

class MySchedulePage extends StatelessWidget {
  const MySchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minha agenda')),
      body: ListView.builder(
        itemCount: 10,
        //scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          //Text('Próximo agendamento', style: TextStyle(fontSize: 18),),
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CardSchedule(
              numSchedule: '123',
              service: 'Corte Social',
              value: '30.00',
              time: '30',
              date: '10/04/2024', 
              urlImage: AppImages.imageBarberShopExemploLink, 
            ),
          );
          /*SizedBox(height: 16,),
          Text('Cidades', style: TextStyle(fontSize: 18),),
          ListAvailableCities(list: ['inhuma', 'Picos', 'inhuma', 'inhuma','inhuma',],),
          SizedBox(height: 16,),
          Text('Barbearias', style: TextStyle(fontSize: 18),),
          ListAvailableBarberShop(list: ['barber shop', "barbearia visual", "zé bola",'barber shop', "barbearia visual", "zé bola", ],)*/
        },
      ),
    );
  }
}