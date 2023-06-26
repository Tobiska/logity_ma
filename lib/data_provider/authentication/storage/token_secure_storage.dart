import 'package:get_it/get_it.dart';
import 'package:logity_ma/domain/entity/auth.dart';
import 'package:logity_ma/domain/services/user/contract.dart';
import 'package:logity_ma/domain/services/user/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage implements ITokensStorage {
  @override
  Future<Token> loadAccessToken() async {
    final prefs = GetIt.instance<SharedPreferences>();

    String? token = prefs.getString("access_token");
    throwIf(token == null, AuthAccessTokenNotExistErr());

    int? exp = prefs.getInt("access_token_expired_at");
    throwIf(exp == null, AuthAccessTokenNotExistErr());

    DateTime expiredAt = DateTime.fromMillisecondsSinceEpoch(exp!);

    if (DateTime.now().isAfter(expiredAt)) {
      throw AuthAccessTokenExpiredErr();
    }

    return Token(token: token!, expiredAt: expiredAt);
  }

  @override
  Future<Token> loadRefreshToken() async {
    final prefs = GetIt.instance<SharedPreferences>();

    String? token = prefs.getString("refresh_token");
    throwIf(token == null, AuthRefreshTokenNotExistErr());

    int? exp = prefs.getInt("refresh_token_expired_at");
    throwIf(exp == null, AuthRefreshTokenNotExistErr());

    DateTime expiredAt = DateTime.fromMillisecondsSinceEpoch(exp!);

    if (DateTime.now().isAfter(expiredAt)) {
      throw AuthRefreshTokenExpiredErr();
    }

    return Token(token: token!, expiredAt: expiredAt);
  }

  @override
  Future<Token> loadRtcToken() async {
    final prefs = GetIt.instance<SharedPreferences>();

    String? token = prefs.getString("rtc_token");
    throwIf(token == null, AuthRtcTokenNotExistErr());

    int? exp = prefs.getInt("rtc_token_expired_at");
    throwIf(exp == null, AuthRtcTokenNotExistErr());

    DateTime expiredAt = DateTime.fromMillisecondsSinceEpoch(exp!);

    if (DateTime.now().isAfter(expiredAt)) {
      throw AuthRtcTokenExpiredErr();
    }

    return Token(token: token!, expiredAt: expiredAt);
  }

  @override
  Future<void> saveAccessToken(Token token) async {
    final prefs = GetIt.instance<SharedPreferences>();

    prefs.setString("access_token", token.token);
    prefs.setInt(
        "access_token_expired_at", token.expiredAt.millisecondsSinceEpoch);
  }

  @override
  Future<void> saveRefreshToken(Token token) async {
    final prefs = GetIt.instance<SharedPreferences>();

    prefs.setString("refresh_token", token.token);
    prefs.setInt(
        "refresh_token_expired_at", token.expiredAt.millisecondsSinceEpoch);
  }

  @override
  Future<void> saveRtcToken(Token token) async {
    final prefs = GetIt.instance<SharedPreferences>();

    prefs.setString("rtc_token", token.token);
    prefs.setInt(
        "rtc_token_expired_at", token.expiredAt.millisecondsSinceEpoch);
  }
}
