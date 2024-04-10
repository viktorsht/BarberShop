import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class CardServiceWidget extends StatelessWidget {
  final String service;
  final String value;
  final String time;
  final String urlImage;

  const CardServiceWidget({
    super.key, 
    required this.service, 
    required this.value, 
    required this.time, 
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(service, style: const TextStyle(fontSize: 16),),
              Row(
                children: [
                  Text('R\$ $value', style: const TextStyle(fontSize: 14)),
                  const SizedBox(width: 8),
                  Text('$time min', style: const TextStyle(fontSize: 14)),
                ],
              )
            ],
          ),
          //DateWidget(date: date),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secundaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: (){}, 
              child: Text("Agendar", style: TextStyle(color: AppColors.secundaryColorText),)
            ),
          ),
        ],
      )
    );
  }
}