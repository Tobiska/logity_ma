import '../../../entity/auth.dart';

abstract class ITokensStorage {
  Future<void> saveRefreshToken(Token token);
  Future<void> saveAccessToken(Token token);
  Future<void> saveRtcToken(Token token);

  Future<Token> loadRefreshToken();
  Future<Token> loadAccessToken();
  Future<Token> loadRtcToken();
}
