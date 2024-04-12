abstract class Headers {
  Map<String, String> get headers;
  Map<String, String> headersToken(String token);
}

class HeadersApi extends Headers {
  
  static Map<String, String> getHeaders() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json;charset=UTF-8',
    };
  }

  @override
  Map<String, String> headersToken(String token) {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    return headers;
  }

  @override
  Map<String, String> get headers => getHeaders();
}