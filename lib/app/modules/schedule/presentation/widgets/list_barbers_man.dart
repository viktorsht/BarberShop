import 'package:barber_shop/app/modules/schedule/presentation/controllers/schedule_controllers.dart';
import 'package:flutter/material.dart';


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
          //color: controller.barberMan == index ? Theme.of(context).colorScheme.secondaryContainer : Theme.of(context).colorScheme.background,,
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
                          color: controller.barberMan == index ? Theme.of(context).colorScheme.secondaryContainer : Theme.of(context).colorScheme.background,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.background,
                          radius: 30,
                          child: Icon(Icons.person, color: Theme.of(context).colorScheme.secondary,)
                        ),
                      ),
                      const SizedBox(height: 4), // Espaçamento entre o avatar e o texto
                      Text(
                        list[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.barberMan == index ? Theme.of(context).colorScheme.secondaryContainer : Theme.of(context).colorScheme.onPrimary,
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
