import 'value_object.dart';

class Name implements ValueObject {
  final String _value;

  Name(this._value);

  String get value => _value;

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Este campo não pode estar vazio';
    }
    return null;
  }

  @override
  String toString() => _value;
}