import 'package:get_it/get_it.dart';
import 'package:logity_ma/domain/services/user/contract.dart';
import 'package:logity_ma/domain/services/user/dto.dart';

import '../../entity/auth.dart';
import '../../entity/user.dart';

class UserService {
  final IUserStorage _userRepository;
  final ITokensStorage _secureStorage;
  final IAuthProvider _authProvider;

  UserService()
      : _userRepository = GetIt.instance<IUserStorage>(),
        _secureStorage = GetIt.instance<ITokensStorage>(),
        _authProvider = GetIt.instance<IAuthProvider>();

  Future<void> signUpByEmail(
      String email, String password, String confirmPassword) async {
    User user = await _authProvider.signUpByEmail(SignUpByEmailDto(
        email: email, password: password, confirmPassword: confirmPassword));

    Auth auth = await _authProvider
        .signIn(SignInDto(login: user.email, password: password));

    _userRepository.saveUser(user);

    saveTokens(auth);
  }

  Future<void> saveTokens(Auth auth) async {
    _secureStorage.saveAccessToken(auth.accessToken);
    _secureStorage.saveRefreshToken(auth.refreshToken);
    _secureStorage.saveRtcToken(auth.rtcToken);
  }

  Future<void> signIn(String login, String password) async {
    Auth auth =
        await _authProvider.signIn(SignInDto(login: login, password: password));

    saveTokens(auth);
  }
}
