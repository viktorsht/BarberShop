
import 'package:barber_shop/app/resources/valueobject/phone.dart';

import '../../../../resources/valueobject/date_of_bird.dart';
import '../../../../resources/valueobject/email.dart';
import '../../../../resources/valueobject/name.dart';
import '../../../../resources/valueobject/password.dart';

class CreateUser {
  Name? firstName;
  Name? lastName;
  Email? email;
  DateOfBirth? dateOfBirth;
  Phone? phone;
  Password? password;
  Password? passwordConfirmation;

  CreateUser(
      {this.email,
      this.firstName,
      this.lastName,
      this.phone,
      this.dateOfBirth,
      this.password,
      this.passwordConfirmation});

  CreateUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    dateOfBirth = json['date_of_birth'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email.toString();
    data['first_name'] = firstName.toString();
    data['last_name'] = lastName.toString();
    data['phone'] = phone.toString();
    data['date_of_birth'] = dateOfBirth.toString();
    data['password'] = password.toString();
    data['password_confirmation'] = passwordConfirmation.toString();
    return data;
  }

  factory CreateUser.empty(){
    return CreateUser(
      email: Email(''),
      firstName: Name(''),
      lastName: Name(''),
      phone: Phone(''),
      dateOfBirth: DateOfBirth(''),
      password: Password(''),
      passwordConfirmation: Password(''),
    );
  }
}
