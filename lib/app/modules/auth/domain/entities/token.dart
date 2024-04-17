class Token {
  String? access;

  Token({this.access});

  Token.fromJson(Map<String, dynamic> json) {
    access = json['access_token'] ?? json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = access;
    return data;
  }
}
