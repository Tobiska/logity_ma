import 'package:logity_ma/domain/services/user/dto.dart';

import '../../entity/auth.dart';
import '../../entity/user.dart';

abstract class IUserStorage {
  Future<User> loadUser();
  Future<void> saveUser(User user);
}

abstract class ITokensStorage {
  Future<void> saveRefreshToken(Token token);
  Future<void> saveAccessToken(Token token);
  Future<void> saveRtcToken(Token token);

  Future<Token> loadRefreshToken();
  Future<Token> loadAccessToken();
  Future<Token> loadRtcToken();
}

abstract class IAuthProvider {
  Future<User> signUpByPhone(SignUpByPhoneDto dto);
  Future<User> verifyPhone(VerifyPhoneDto dto);
  Future<User> signUpByEmail(SignUpByEmailDto dto);

  Future<Auth> signIn(SignInDto dto);
}
