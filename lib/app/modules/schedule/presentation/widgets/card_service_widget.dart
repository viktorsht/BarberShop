import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../utils/constants/app_colors.dart';

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
          Center(
            child: CircleAvatar(
              radius: 40,
              child: ClipOval(
                child: Image.network(
                  urlImage,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Icon(Icons.person);
                  },
                ),
              ),
            ),
          ),
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
                backgroundColor: AppColors.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: (){
                Modular.to.pushNamed("${AppRoutes.scheduleModule}${AppRoutes.schedule}");
              }, 
              child: Text("Agendar", style: TextStyle(color: AppColors.secundaryColorText),)
            ),
          ),
        ],
      )
    );
  }
}