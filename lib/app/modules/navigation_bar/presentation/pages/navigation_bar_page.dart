import 'package:barber_shop/app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../widgets/navigator_widget.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  
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
      /*appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá, Usuário'),
            Text('Segunda, 08 abril de 2024', style: TextStyle(fontSize: 12),),
          ],
        ),
      ),*/
      body: ListenableBuilder(
        listenable: pageController,
        builder: (context, child) => Center(
          child: PageView(
            controller: pageController,
            children: const [
              HomePage(),
              Text('Próximo agendamento 1'),
              Text('Próximo agendamento 2'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: pageController,
        builder: (context, child) => NavigatorWidget(controller: pageController),
      ),
    );
  }
}