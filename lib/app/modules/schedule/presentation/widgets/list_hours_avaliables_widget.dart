import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../controllers/schedule_controllers.dart';
import 'confirm_modal.dart';

class ListHoursAvailablesWidget extends StatelessWidget {
  final List<String> list; // depois tem que mudar o tipo da lista
  const ListHoursAvailablesWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final controller = ScheduleController();
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
                  controller.selectHours(index);
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmModal(
                        title: 'Confirmação',
                        nameBarberShop: 'Barbearia Visual',
                        nameBarberMan: 'Thiago',
                        onConfirm: () {
                          // Lógica para confirmar a ação
                          Navigator.of(context).pop(); // Fechar o modal
                        },
                      );
                    },
                  );
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: controller.hourSelect == index ? AppColors.buttonColor : AppColors.background, 
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      list[index], 
                      style: TextStyle(
                        color: controller.hourSelect == index ? AppColors.secundaryColorText : AppColors.primaryColorText, 
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