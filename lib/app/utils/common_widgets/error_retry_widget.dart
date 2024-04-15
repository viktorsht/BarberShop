import 'package:barber_shop/app/utils/constants/app_images.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ErrorRetryWidget extends StatelessWidget {
  final String errorMessage;
  final String msgButton;
  final Function onRetry;

  const ErrorRetryWidget({super.key, required this.errorMessage, required this.onRetry, required this.msgButton});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(AppImages.error,height: 100),
          const SizedBox(height: 20),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))
              )
            ),
            onPressed: () => onRetry(),
            child: Text(
              msgButton, 
              style: TextStyle(fontSize: 16, color: AppColors.secundaryColorText),
            ),
          ),
        ],
      ),
    );
  }
}
