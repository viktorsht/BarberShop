import 'states.dart';

class City {
  int? id;
  String? name;
  String? abb;
  int? stateId;
  String? createdAt;
  String? updatedAt;
  State? state;

  City(
      {this.id,
      this.name,
      this.abb,
      this.stateId,
      this.createdAt,
      this.updatedAt,
      this.state});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abb = json['abb'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abb'] = abb;
    data['state_id'] = stateId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    return data;
  }
}
