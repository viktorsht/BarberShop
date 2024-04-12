import 'value_object.dart';

class Link implements ValueObject {
  final String _value;  
  static final RegExp _linkRegex = RegExp(
      r'^(?:(?:http|https):\/\/)?(?:www\.)?[a-z0-9\-\.]+\.[a-z]{2,}(?::[0-9]{1,5})?(?:\/[^\s]*)?$');

  Link(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return null;
    } else if (!_linkRegex.hasMatch(_value)) {
      return 'Formato de link inválido';
    }
    return null;
  }

  @override
  String toString() => _value;
}
