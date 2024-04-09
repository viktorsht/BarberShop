import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final String date;

  const DateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);
    String formattedDate = '${parsedDate.day}';
    String monthName = DateFormat('MMMM').format(parsedDate);

    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          monthName,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
  
}