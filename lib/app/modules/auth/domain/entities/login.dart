import '../../../../resources/valueobject/email.dart';
import '../../../../resources/valueobject/password.dart';

class Login {
  Email? email;
  Password? password;

  Login({this.email, this.password});

  Login.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email.toString();
    data['password'] = password.toString();
    return data;
  }

  factory Login.empty(){
    return Login(
      email: Email(''), 
      password: Password(''),
    );
  }
}