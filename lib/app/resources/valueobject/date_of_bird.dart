import 'value_object.dart';

class DateOfBirth implements ValueObject {
  final String _value;

  DateOfBirth(this._value);

  String get value => _value;

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Nascimento não definido';
    }
    return null;
  }

  @override
  String toString() => _value;
}