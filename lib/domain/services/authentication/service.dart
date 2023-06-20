import 'package:get_it/get_it.dart';

import '../../entity/user.dart';
import '../user/contract.dart';
import '../user/dto.dart';

class AuthService {
  final IUserStorage _userStorage;
  final IAuthProvider _authProvider;

  AuthService()
      : _userStorage = GetIt.instance<IUserStorage>(),
        _authProvider = GetIt.instance<IAuthProvider>();

  Future<void> signUpByEmail(
      String email, String password, String confirmPassword) async {
    User user = await _authProvider.signUpByEmail(SignUpByEmailDto(
        email: email, password: password, confirmPassword: confirmPassword));

    await _authProvider
        .signIn(SignInDto(login: user.email!, password: password));

    _userStorage.saveUser(user);
  }

  Future<void> signIn(String login, String password) async {
    await _authProvider.signIn(SignInDto(login: login, password: password));
  }
}
