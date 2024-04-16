class State {
  int? id;
  String? name;
  String? abb;
  String? createdAt;
  String? updatedAt;

  State({this.id, this.name, this.abb, this.createdAt, this.updatedAt});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abb = json['abb'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abb'] = abb;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}