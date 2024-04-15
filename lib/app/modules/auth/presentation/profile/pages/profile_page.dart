import 'package:barber_shop/app/configs/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../utils/common_widgets/error_retry_widget.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../domain/states/logged_state.dart';
import '../controller/profile_controller.dart';
import '../controller/profile_state.dart';

class ProfilePage extends StatefulWidget {
  final ProfileController controller;
  const ProfilePage({super.key, required this.controller});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    widget.controller.profile();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, child) {
          if(widget.controller.state is ProfileError){
            return ErrorRetryWidget(
              msgButton: 'Tentar novamente',
              errorMessage: 'Ops! Ocorreu um erro!',
              onRetry: () => widget.controller.profile(),
            );
          }
          if(widget.controller.state is NotLoggedIn){
            return ErrorRetryWidget(
              msgButton: 'Fazer login',
              errorMessage: 'Você não está logado, faça login',
              onRetry: () => Modular.to.navigate(AppRoutes.authModule),
            );
          }
          if(widget.controller.state is ProfileLoading){
            return Center(child: CircularProgressIndicator(color: AppColors.secundaryColor));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nome'),
                  TextFormField(
                    initialValue: widget.controller.user.firstName.toString()
                  ),
                  const SizedBox(height: 8,),
                  const Text('Sobrenome'),
                  TextFormField(
                    initialValue: widget.controller.user.lastName.toString()
                  ),
                  const SizedBox(height: 8,),
                  const Text('Email'),
                  TextFormField(
                    initialValue: widget.controller.user.email.toString()
                  ),
                  const SizedBox(height: 16,),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        )
                      ),
                      onPressed: (){}, 
                      child: Text("Atualizar", style: TextStyle(color: AppColors.secundaryColorText),)
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}