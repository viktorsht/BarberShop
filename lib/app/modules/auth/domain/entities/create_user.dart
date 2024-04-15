
import '../../../../resources/valueobject/email.dart';
import '../../../../resources/valueobject/name.dart';
import '../../../../resources/valueobject/password.dart';

class CreateUser {
  Email? email;
  Name? firstName;
  Name? lastName;
  Password? password;
  Password? passwordConfirmation;

  CreateUser(
      {this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.passwordConfirmation});

  CreateUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email.toString();
    data['first_name'] = firstName.toString();
    data['last_name'] = lastName.toString();
    data['password'] = password.toString();
    data['password_confirmation'] = passwordConfirmation.toString();
    return data;
  }

  factory CreateUser.empty(){
    return CreateUser(
      email: Email(''),
      firstName: Name(''),
      lastName: Name(''),
      password: Password(''),
      passwordConfirmation: Password(''),
    );
  }
}
