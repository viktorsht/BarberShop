import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../configs/routes/app_routes.dart';
import '../../../../../utils/common_widgets/text_form_field_widget.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../resources/valueobject/email.dart';
import '../../../../../resources/valueobject/password.dart';
import '../../../domain/entities/login.dart';
import '../controller/login_controller.dart';
import '../controller/login_state.dart';
import '../widgets/password_look.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  const LoginPage({super.key, required this.controller});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  var entity = Login.empty();

  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  bool isViewPassword = false;

  void setIsViewPassword(){
    setState(() {
      isViewPassword = !isViewPassword;
    });
  }

  void showSnackBar(String message){
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.errorColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.login),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.logo,width: 160.0),
                        const Align(
                          alignment: Alignment.center,
                          child: Text('Entre em sua conta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 8,),
                        TextFormFieldWidget(
                          hint: 'Email',
                          value: entity.email!.toString(),
                          onChanged: (p0) => entity.email = Email(p0),
                          validator: (p0) => entity.email!.validator(),
                        ),
                        const SizedBox(height: 10,),
                        TextFormFieldWidget(
                          hint: 'Senha',
                          value: entity.password!.toString(),
                          onChanged: (p0) => entity.password = Password(p0),
                          validator: (p0) => entity.password!.validator(),
                          obscure: !isViewPassword,
                          suffix: PasswordLook(
                            onPressed: setIsViewPassword, 
                            iconData: isViewPassword ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_rounded,
                          ),
                        ),
                        //const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => {},// Modular.to.navigate('${AppRoutes.authModule}${AppRoutes.createUser}'),
                            child: Text("Esqueceu sua senha?", style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secundaryColor
                              ),
                            ),
                          ),
                        ),
                        //const SizedBox(height: 8),
                        ListenableBuilder(
                          listenable: widget.controller,
                          builder: (context, child) {
                            return FractionallySizedBox(
                              widthFactor: 0.4,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final valid = form.validate();
                                  if(valid){
                                    await widget.controller.login(entity);
                                    if(widget.controller.state is LoginSucess){
                                      Modular.to.navigate(AppRoutes.homeModule);
                                    }
                                    if(widget.controller.state is LoginError){
                                      showSnackBar('Email ou senha incorretos');
                                    }
                                  }
                                  else{
                                    showSnackBar('Email ou senha inválidos');
                                  }
                                }, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.buttonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                                child: widget.controller.state is LoginLoading 
                                ? CircularProgressIndicator(color: AppColors.primaryColor,) 
                                : Text("Entrar", style: TextStyle(color: AppColors.primaryColor, fontSize: 16),),
                              ),
                            );
                          }
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: () => Modular.to.navigate('${AppRoutes.authModule}${AppRoutes.createUser}'),
                            child: Text(
                              "Criar uma conta",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secundaryColor
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}