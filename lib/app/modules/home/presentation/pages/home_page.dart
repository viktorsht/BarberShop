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
              Text('Próximo agendamento'),
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