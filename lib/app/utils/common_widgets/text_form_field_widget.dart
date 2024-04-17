import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hint;
  final String value;
  final bool? obscure;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextInputFormatter? inputFormatter;

  const TextFormFieldWidget({
    super.key,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.onChanged, 
    required this.hint,
    required this.value,
    this.obscure,
    this.validator, this.inputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscure != null ? obscure! : false,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
        style: const TextStyle(fontSize: 16),
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
      );
    //);
  }
}