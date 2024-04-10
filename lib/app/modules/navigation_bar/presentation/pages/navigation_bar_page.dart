import 'package:barber_shop/app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../my_schedules/my_schedules_page.dart';
import '../widgets/navigator_widget.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  
  final pageController = PageController();
  bool loading = true;

  Future<void> initPage() async { 
    Future.delayed(
      const Duration(milliseconds: 5000),
      () {
        setState(() {
          loading = false;
        });
        //Modular.to.navigate(AppRoutes.navigationModule);//${AppRoutes.createUser}'); // vai ser home
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initPage();
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
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Skeletonizer(enabled: loading, child: const HomePage()),
              Skeletonizer(enabled: loading, child: const MySchedulePage()),
              Skeletonizer(enabled: loading, child: const Text('Próximo agendamento 2')),
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