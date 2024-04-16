class Barbershop {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  Barbershop(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.cityId,
      this.createdAt,
      this.updatedAt});

  Barbershop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}