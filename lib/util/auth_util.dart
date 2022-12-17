class AuthUtil {
  final String username;
  final String password;
  final String? avatarUrl;
  final String token;
  final String refreshToken;
  final String expire;

  AuthUtil(
    this.username,
    this.password,
    this.avatarUrl,
    this.token,
    this.refreshToken,
    this.expire,
  );
}
