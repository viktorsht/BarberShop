import 'package:flutter/material.dart';

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
          const Icon(
            Icons.error,
            size: 50,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onRetry(),
            child: Text(
              msgButton, 
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
