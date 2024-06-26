import 'package:barber_shop/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/city.dart';

class ListAvailableCities extends StatelessWidget {
  final List<City> list; // depois tem que mudar o tipo da lista
  final HomeController controller;

  const ListAvailableCities({super.key, required this.list, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) => SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  controller.selectCity(list[index].id!);
                  await controller.getBarberShop();
                },
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: controller.citySelect == list[index].id ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.background, 
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      list[index].name!, 
                      maxLines: 2,
                      style: TextStyle(
                        color: controller.citySelect == list[index].id ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onPrimary, 
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis
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