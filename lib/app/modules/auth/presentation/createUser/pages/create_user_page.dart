import 'package:barber_shop/app/resources/valueobject/date_of_bird.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../configs/routes/app_routes.dart';
import '../../../../../resources/valueobject/phone.dart';
import '../../../../../utils/common_widgets/text_form_field_widget.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../resources/valueobject/email.dart';
import '../../../../../resources/valueobject/name.dart';
import '../../../../../resources/valueobject/password.dart';
import '../../../../../utils/maskeds/masked_input_formatter.dart';
import '../../../../../utils/maskeds/phone_input_formatter.dart';
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
                  padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.logo, width: 200,),
                        const Text('Crie sua conta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormFieldWidget(
                                hint: 'Nome',
                                value: entity.firstName!.toString(),
                                onChanged: (p0) => entity.firstName = Name(p0),
                                validator: (p0) => entity.firstName!.validator(),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: TextFormFieldWidget(
                                hint: 'Sobrenome',
                                value: entity.lastName!.toString(),
                                onChanged: (p0) => entity.lastName = Name(p0),
                                validator: (p0) => entity.lastName!.validator(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        TextFormFieldWidget(
                          hint: 'Email',
                          value: entity.email!.toString(),
                          onChanged: (p0) => entity.email = Email(p0),
                          validator: (p0) => entity.email!.validator(),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormFieldWidget(
                                hint: 'Nascimento',
                                value: entity.dateOfBirth!.toString(),
                                onChanged: (p0) => entity.dateOfBirth = DateOfBirth(p0),
                                validator: (p0) => entity.dateOfBirth!.validator(),
                                keyboardType: TextInputType.number,
                                inputFormatter:  DateMaskedInputFormatter(mask: '##/##/####'),
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              child: TextFormFieldWidget(
                                hint: 'Telefone',
                                value: entity.phone!.toString(),
                                onChanged: (p0) => entity.phone = Phone(p0),
                                validator: (p0) => entity.phone!.validator(),
                                keyboardType: TextInputType.phone,
                                inputFormatter: PhoneMaskedInputFormatter(mask: '(##)#########'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8,),
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
                        const SizedBox(height: 8,),
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
                              widthFactor: 0.4,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final valid = form.validate();
                                  if(valid){
                                    await widget.controller.createUser(entity);
                                    if(widget.controller.state is CreateUserSucess){
                                      showSnackBar('Conta criada com sucesso!', AppColors.sucessColor);
                                      Future.delayed(
                                        const Duration(seconds: 2),
                                        () => Modular.to.navigate(AppRoutes.authModule)
                                      );
                                    }
                                    if(widget.controller.state is CreateUserError){
                                      showSnackBar('Erro no cadastro do usuário', AppColors.errorColor);
                                    }
                                  }
                                  else{
                                    showSnackBar('Fornceça os dados corretamente', AppColors.errorColor);
                                  }
                                }, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.buttonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                                child: widget.controller.state is CreateUserLoading 
                                ? CircularProgressIndicator(color: AppColors.primaryColor,) 
                                : Text("Cadastre-se", style: TextStyle(color: AppColors.primaryColor, fontSize: 16),),
                              ),
                            );
                          }
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: () {Modular.to.navigate(AppRoutes.authModule);},
                            child: Text(
                              "Já tenho uma conta",
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
          ],
        ),
      ),
    );
  }
}