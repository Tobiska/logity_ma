import 'package:get_it/get_it.dart';

import '../../entity/user.dart';
import '../user/contract.dart';
import '../user/dto.dart';

class AuthService {
  final IAuthProvider _authProvider;
  final ITokensStorage _tokensStorage;

  AuthService()
      : _tokensStorage = GetIt.instance<ITokensStorage>(),
        _authProvider = GetIt.instance<IAuthProvider>();

  Future<void> signUpByEmail(
      String email, String password, String confirmPassword) async {
    User user = await _authProvider.signUpByEmail(SignUpByEmailDto(
        email: email, password: password, confirmPassword: confirmPassword));

    await _authProvider
        .signIn(SignInDto(login: user.email!, password: password));
  }

  Future<void> signIn(String login, String password) async {
    await _authProvider.signIn(SignInDto(login: login, password: password));
  }

  Future<void> checkUserTokens() async {
    await _tokensStorage.loadRefreshToken();
    await _tokensStorage.loadRtcToken();
  }
}
