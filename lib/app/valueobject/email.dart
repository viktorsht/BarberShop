import 'value_object.dart';

class Email implements ValueObject {
  final String _value;
  static final RegExp _emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  Email(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Este campo não pode ser vazio';
    } else if (!_emailRegex.hasMatch(_value)) {
      return 'Formato de e-mail inválido';
    }
    return null;
  }

  @override
  String toString() => _value;
}