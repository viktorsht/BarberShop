import 'value_object.dart';

class Phone implements ValueObject {
  final String _value;

  Phone(this._value);

  String get value => _value;

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Adicione um número de telefone';
    } else if (_value.length != 11) {
      return 'Formato de telefone inválido';
    }
    return null;
  }

  @override
  String toString() => _value;
}