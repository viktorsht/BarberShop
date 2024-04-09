import 'package:barber_shop/app/common_widgets/card_schedule.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Próximo agendamento 1', style: TextStyle(fontSize: 18),),
          CardSchedule(numSchedule: '123', service: 'Corte Social', value: '30.00', time: '30', date: '10/04/2024', urlImage: '', ),
        ],
      ),
    );
  }
}