import 'package:barber_shop/app/modules/schedule/presentation/controllers/schedule_controllers.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class ListBarbersMan extends StatelessWidget {
  final List<String> list;

  const ListBarbersMan({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final controller = ScheduleController();

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return SizedBox(
          height: 100, // Ajuste a altura conforme necessário
          //color: controller.barberMan == index ? AppColors.buttonColor : AppColors.background,,
          child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Ajuste o espaçamento horizontal conforme necessário
                child: GestureDetector(
                  onTap: () {
                    controller.selectBarberMan(index);
                    //print(controller.barberMan);
                    //Modular.to.navigate(AppRoutes.scheduleModule);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.barberMan == index ? AppColors.buttonColor : AppColors.background,
                        ),
                        child: CircleAvatar(
                          backgroundColor: AppColors.background,
                          radius: 30,
                          child: Icon(Icons.person, color: AppColors.secundaryColor,)
                        ),
                      ),
                      const SizedBox(height: 4), // Espaçamento entre o avatar e o texto
                      Text(
                        list[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.barberMan == index ? AppColors.buttonColor : AppColors.primaryColorText,
                          fontSize: 14,
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
    );
  }
}
