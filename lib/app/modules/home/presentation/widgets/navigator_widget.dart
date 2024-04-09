import 'package:barber_shop/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {

  final PageController pageController;
  
  const NavigatorWidget({
    super.key, 
    required this.pageController
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: pageController,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.background
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: pageController.page?.round() ?? 0,
          onTap: (index) => pageController.jumpToPage(index),
          selectedItemColor: AppColors.secundaryColor,
          //unselectedItemColor: AppColors.background,
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