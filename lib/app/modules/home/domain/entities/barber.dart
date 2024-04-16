import 'barber_shop.dart';
import 'city.dart';

class Barber {
  int? id;
  String? name;
  int? barbershopId;
  int? cityId;
  String? openingTime;
  String? closingTime;
  String? createdAt;
  String? updatedAt;
  Barbershop? barbershop;
  City? city;

  Barber(
      {this.id,
      this.name,
      this.barbershopId,
      this.cityId,
      this.openingTime,
      this.closingTime,
      this.createdAt,
      this.updatedAt,
      this.barbershop,
      this.city});

  Barber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    barbershopId = json['barbershop_id'];
    cityId = json['city_id'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    barbershop = json['barbershop'] != null
        ? Barbershop.fromJson(json['barbershop'])
        : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['barbershop_id'] = barbershopId;
    data['city_id'] = cityId;
    data['opening_time'] = openingTime;
    data['closing_time'] = closingTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (barbershop != null) {
      data['barbershop'] = barbershop!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}
