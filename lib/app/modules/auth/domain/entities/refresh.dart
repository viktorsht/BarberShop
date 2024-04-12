class Refresh {
  String? refresh;

  Refresh({this.refresh});

  Refresh.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    return data;
  }
}
