class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;

  User({this.id, this.email, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['email'] = email.toString();
    data['first_name'] = firstName.toString();
    data['last_name'] = lastName.toString();
    return data;
  }

  factory User.empty(){
    return User(
      id: -1,
      email: '',
      firstName: '',
      lastName:  ''
    );
  }
}
