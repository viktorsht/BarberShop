import 'package:flutter/material.dart';

import '../../../../utils/date_format_converter.dart';

class DateWidget extends StatelessWidget {
  final String date;

  const DateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(
          formattedDate(date),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          monthName(date),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
  
}