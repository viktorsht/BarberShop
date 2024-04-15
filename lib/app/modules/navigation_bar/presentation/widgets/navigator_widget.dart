import 'package:barber_shop/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  final PageController controller;
  
  const NavigatorWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.background
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.page?.round() ?? 0,
          onTap: (index) => controller.jumpToPage(index),
          selectedItemColor: AppColors.buttonColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.schedule),label: 'Minha Agenda'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}