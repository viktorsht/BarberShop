import 'value_object.dart';

class Phone implements ValueObject {
  final String _value;

  Phone(this._value);

  String get value => _value;

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Telefone não definido';
    } else if (_value.length != 13) {
      return 'Telefone inválido';
    }
    return null;
  }

  @override
  String toString() => _value;
}