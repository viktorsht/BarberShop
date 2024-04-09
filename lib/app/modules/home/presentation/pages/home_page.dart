import 'package:barber_shop/app/common_widgets/card_schedule.dart';
import 'package:flutter/material.dart';

import '../widgets/navigator_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final pageController = PageController();


  @override
  void initState() {
    super.initState();
    // carregar proxímo agendamento
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá, Usuário'),
            Text('Segunda, 08 abril de 2024', style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
      body: ListenableBuilder(
        listenable: pageController,
        builder: (context, child) => Center(
          child: PageView(
            controller: pageController,
            children: const [
              Home1(),
              Text('Próximo agendamento 1'),
              Text('Próximo agendamento 2'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: pageController,
        builder: (context, child) => NavigatorWidget(pageController: pageController),
      ),
    );
  }
}

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Próximo agendamento 1', style: TextStyle(fontSize: 18),),
          CardSchedule(numSchedule: '123', service: 'Corte Social', value: '30.00', time: '30', date: '10/04/2024', urlImage: '', ),
        ],
      ),
    );
  }
}