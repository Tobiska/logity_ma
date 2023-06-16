class Token {
  final String token;
  final DateTime expiredAt;

  Token.fromString({required this.token, required String expiredAt})
      : expiredAt = DateTime.parse(expiredAt);

  Token({required this.token, required this.expiredAt});
}

class Auth {
  Token refreshToken;
  Token accessToken;
  Token rtcToken;

  Auth(
      {required this.refreshToken,
      required this.accessToken,
      required this.rtcToken});
}
