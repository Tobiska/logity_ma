import 'package:logity_ma/domain/services/user/dto.dart';

import '../../entity/auth.dart';
import '../../entity/user.dart';

abstract class ITokensStorage {
  Future<void> saveRefreshToken(Token token);
  Future<void> saveAccessToken(Token token);
  Future<void> saveRtcToken(Token token);

  Future<Token> loadRefreshToken();
  Future<Token> loadAccessToken();
  Future<Token> loadRtcToken();
}

abstract class IUserProvider {
  Future<User> getMeInfo();
}

abstract class IAuthProvider {
  Future<User> signUpByPhone(SignUpByPhoneDto dto);
  Future<User> verifyPhone(VerifyPhoneDto dto);
  Future<User> signUpByEmail(SignUpByEmailDto dto);

  Future<void> signIn(SignInDto dto);

  Future<void> refreshSubscribes(SignUpByEmailDto dto);

  Future<User> getMeInfo();
}
