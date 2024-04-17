import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../auth/presentation/profile/controller/profile_controller.dart';
import '../../../auth/presentation/profile/pages/profile_page.dart';
import '../../../home/presentation/controllers/home_controller.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../my_schedules/my_schedules_page.dart';
import '../widgets/navigator_widget.dart';

class NavigationBarPage extends StatefulWidget {
  final HomeController homeController;
  final ProfileController profileController;
  const NavigationBarPage({super.key, required this.homeController, required this.profileController});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  
  final pageController = PageController();
  bool loading = true;

  Future<void> initPage() async { 
    await widget.homeController.getCity();
    await widget.homeController.getBarberShop();
    await widget.profileController.profile();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          loading = false;
        });
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
      body: ListenableBuilder(
        listenable: pageController,
        builder: (context, child) => Center(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Skeletonizer(
                enabled: loading, child: ListenableBuilder(
                  listenable: widget.homeController,
                  builder: (context, child) {
                    return HomePage(controller: widget.homeController, name: widget.profileController.user.firstName);
                  }
                )
              ),
              Skeletonizer(enabled: loading, child: const MySchedulePage()),
              Skeletonizer(
                enabled: loading, 
                child: ListenableBuilder(
                  listenable: widget.profileController,
                  builder: (context, child) {
                    return ProfilePage(controller: widget.profileController);
                  }
                )
              ),
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