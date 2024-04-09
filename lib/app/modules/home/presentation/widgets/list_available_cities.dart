import 'package:barber_shop/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class ListAvailableCities extends StatelessWidget {
  final List<String> list; // depois tem que mudar o tipo da lista
  const ListAvailableCities({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) => SizedBox(
        height: 60,
        child: ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  controller.selectCity(index);
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: controller.citySelect == index ? AppColors.buttonColor : AppColors.background, 
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      list[index], 
                      style: TextStyle(
                        color: controller.citySelect == index ? AppColors.secundaryColorText : AppColors.primaryColorText, 
                        fontSize: 14
                      ),
                    ),
                  ),
                )
              ),
            );
          }
        ),
      ),
    );
  }
}