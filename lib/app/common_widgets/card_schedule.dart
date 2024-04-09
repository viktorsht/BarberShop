import 'package:barber_shop/app/modules/navigation_bar/presentation/widgets/date_widget.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';


class CardSchedule extends StatelessWidget {
  final String numSchedule;
  final String service;
  final String value;
  final String time;
  final String date;
  final String urlImage;

  const CardSchedule({
    super.key, 
    required this.numSchedule, 
    required this.service, 
    required this.value, 
    required this.time, 
    required this.date, 
    required this.urlImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: AppColors.background),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Center(child: CircleAvatar()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Agendamento nº $numSchedule', style: const TextStyle(fontSize: 14),),
              Text(service, style: const TextStyle(fontSize: 14),),
              Row(
                children: [
                  Text('R\$ $value', style: const TextStyle(fontSize: 14)),
                  const SizedBox(width: 8),
                  Text('$time min', style: const TextStyle(fontSize: 14)),
                ],
              )
            ],
          ),
          DateWidget(date: date),
        ],
      )
    );
  }
}