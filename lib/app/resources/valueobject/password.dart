import 'value_object.dart';

class Password implements ValueObject {
  final String _value;

  Password(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Senha não definida';
    }

    if (_value.length < 8) {
      return 'Precisa 8 caracteres com letras e números';
    }

    if (!_value.contains(RegExp(r'[A-Z]'))) {
      return 'Falta uma letra maiúscula';
    }

    if (!_value.contains(RegExp(r'[0-9]'))) {
      return 'Falta um número';
    }

    return null;
  }

  @override
  String toString() => _value.toUpperCase();
}