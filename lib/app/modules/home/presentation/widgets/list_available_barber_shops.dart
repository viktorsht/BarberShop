import 'package:barber_shop/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:barber_shop/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../constants/app_colors.dart';

class ListAvailableBarberShop extends StatelessWidget {
  final List<String> list;

  const ListAvailableBarberShop({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return SizedBox(
      height: 100, // Ajuste a altura conforme necessário
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Ajuste o espaçamento horizontal conforme necessário
            child: GestureDetector(
              onTap: () {
                controller.selectBarberShop(index);
                Modular.to.navigate(AppRoutes.scheduleModule);
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: controller.citySelect == index ? AppColors.buttonColor : AppColors.background,
                    radius: 30,
                    child: Text(
                      list[index].substring(0, 1), // Apenas a primeira letra do nome como avatar
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: controller.citySelect == index ? AppColors.secundaryColorText : AppColors.primaryColorText,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4), // Espaçamento entre o avatar e o texto
                  SizedBox(
                    width: 60, // Defina a largura do texto conforme necessário
                    child: Text(
                      list[index],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: controller.citySelect == index ? AppColors.secundaryColorText : AppColors.primaryColorText,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
