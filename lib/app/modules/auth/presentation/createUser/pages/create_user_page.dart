import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../common_widgets/text_form_field_widget.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_images.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../valueobject/email.dart';
import '../../../../../valueobject/name.dart';
import '../../../../../valueobject/password.dart';
import '../../../domain/entities/create_user.dart';
import '../../login/widgets/password_look.dart';
import '../controller/create_user_controller.dart';
import '../controller/create_user_state.dart';

class CreateUserPage extends StatefulWidget {
  final CreateUserController controller;
  const CreateUserPage({super.key, required this.controller});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {

  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  bool isViewPassword = false;
  bool isViewConfirPassword = false;

  final entity = CreateUser.empty();

  void setIsViewPassword(){
    setState(() {
      isViewPassword = !isViewPassword;
    });
  }

  void setIsViewConfirPassword(){
    setState(() {
      isViewConfirPassword = !isViewConfirPassword;
    });
  }

  void showSnackBar(String message, Color color){
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 16),),
      duration: const Duration(seconds: 3),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo, width: 200,),
                  const SizedBox(height: 8,),
                  const Text('Crie sua conta no Repense App', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16,),
                  TextFormFieldWidget(
                    hint: 'Nome',
                    value: entity.firstName!.toString(),
                    onChanged: (p0) => entity.firstName = Name(p0),
                    validator: (p0) => entity.firstName!.validator(),
                  ),
                  const SizedBox(height: 8,),
                  TextFormFieldWidget(
                    hint: 'Sobrenome',
                    value: entity.lastName!.toString(),
                    onChanged: (p0) => entity.lastName = Name(p0),
                    validator: (p0) => entity.lastName!.validator(),
                  ),
                  const SizedBox(height: 8,),
                  TextFormFieldWidget(
                    hint: 'Email',
                    value: entity.email!.toString(),
                    onChanged: (p0) => entity.email = Email(p0),
                    validator: (p0) => entity.email!.validator(),
                    keyboardType: TextInputType.emailAddress,
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
                  const SizedBox(height: 10,),
                  TextFormFieldWidget(
                    hint: 'Confirmar senha',
                    value: entity.passwordConfirmation!.toString(),
                    onChanged: (p0) => entity.passwordConfirmation = Password(p0),
                    validator: (p0) => entity.passwordConfirmation!.validator(),
                    obscure: !isViewConfirPassword,
                    suffix: PasswordLook(
                      onPressed: setIsViewConfirPassword, 
                      iconData: isViewConfirPassword ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_rounded,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  ListenableBuilder(
                    listenable: widget.controller,
                    builder: (context, child) {
                      return FractionallySizedBox(
                        widthFactor: 0.6,
                        child: ElevatedButton(
                          onPressed: () async {
                            final valid = form.validate();
                            if(valid){
                              await widget.controller.createUser(entity);
                              if(widget.controller.state is CreateUserSucess){
                                showSnackBar('Conta criada com sucesso!', AppColors.sucessColor);
                                Future.delayed(
                                  const Duration(milliseconds: 2500),
                                  () => Modular.to.navigate(AppRoutes.authModule)
                                );
                              }
                              if(widget.controller.state is CreateUserError){
                                showSnackBar('Erro no cadastro do usuário', AppColors.errorColor);
                              }
                            }
                            else{
                              showSnackBar('Dados inválidos inválidos', AppColors.errorColor);
                            }
                          }, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonColor,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                            )
                          ),
                          child: widget.controller.state is CreateUserLoading 
                          ? CircularProgressIndicator(color: AppColors.primaryColor,) 
                          : Text("Cadastre-se", style: TextStyle(color: AppColors.primaryColor, fontSize: 20),),
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 16,),
                  const Divider(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {Modular.to.navigate(AppRoutes.authModule);},
                      child: Text(
                          "Já tenho uma conta",
                          style: TextStyle(
                            fontSize: 17,
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
    );
  }
}