import 'package:flutter/material.dart';

import '../controllers/forgot_password_controller.dart';
import '../controllers/forgot_password_state.dart';

class ForgotPasswordPage extends StatefulWidget {
  final ForgotPasswordController controller;
  const ForgotPasswordPage({super.key, required this.controller});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  void showSnackBar(String message){
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: Theme.of(context).colorScheme.error,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Esqueceu a Senha'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Informe o e-mail para o qual deseja redefinir a sua senha.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ListenableBuilder(
                listenable: widget.controller,
                builder: (context, child) {
                  return FractionallySizedBox(
                    widthFactor: 0.5,
                    child: ElevatedButton(
                      onPressed: () async {
                        final valid = form.validate();
                        if(valid){
                          await widget.controller.forgotPassword(_emailController.text);
                          if(widget.controller.state is ForgotSucess){
                            //Modular.to.navigate(AppRoutes.homeModule);
                          }
                          if(widget.controller.state is ForgotError){
                            showSnackBar('Email ou senha incorretos');
                          }
                        }
                        else{
                          showSnackBar('Email ou senha inválidos');
                        }
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      child: widget.controller.state is ForgotLoading 
                      ? CircularProgressIndicator(color: Theme.of(context).colorScheme.primary,) 
                      : Text("Redefinir senha", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16),),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}