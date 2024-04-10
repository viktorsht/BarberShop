import 'package:flutter/material.dart';

import '../widgets/card_service_widget.dart';


class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Serviços disponíveis')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CardServiceWidget(service: 'Corte Social', value: '30.00', time: '30', urlImage: '', ),
          );
        },
      ),
    );
  }
}