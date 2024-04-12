abstract class TokenRepository {
  Future<void> saveToken(String token);
  Future<void> saveRefreshToken(String refreshToken);
  Future<String?> getToken();
  Future<String?> getRefreshToken();
  Future<void> deleteToken();
  Future<void> deleteRefreshToken();
  Future<void> deleteAll();
}
