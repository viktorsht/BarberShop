import 'package:flutter/material.dart';

import '../../../../utils/common_widgets/card_schedule.dart';

class ConfirmModal extends StatelessWidget {
  final String title;
  final String nameBarberShop;
  final String nameBarberMan;
  final VoidCallback onConfirm;

  const ConfirmModal({
    super.key,
    required this.title,
    required this.nameBarberShop,
    required this.onConfirm, 
    required this.nameBarberMan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: Icon(Icons.close, color: Theme.of(context).colorScheme.error,),
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o modal
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(nameBarberShop),
          const SizedBox(height: 20),
          const CardSchedule(
            numSchedule: '',
             service: '',
              value: '',
               time: '',
                date: '10/04/2024',
                 urlImage: '',
          ),
          const SizedBox(width: 10),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              onPressed: onConfirm,
              child: Text('Confirmar Agendamento', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),),
            ),
          ),
        ],
      ),
    );
  }
}
