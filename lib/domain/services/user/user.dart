import 'package:get_it/get_it.dart';
import 'package:logity_ma/domain/services/user/contract.dart';
import 'package:logity_ma/domain/services/user/dto.dart';

import '../../entity/user.dart';

class UserService {
  final IUserStorage _userRepository;
  final IAuthProvider _authProvider;

  UserService()
      : _userRepository = GetIt.instance<IUserStorage>(),
        _authProvider = GetIt.instance<IAuthProvider>();

  Future<void> signUpByEmail(
      String email, String password, String confirmPassword) async {
    User user = await _authProvider.signUpByEmail(SignUpByEmailDto(
        email: email, password: password, confirmPassword: confirmPassword));

    await _authProvider
        .signIn(SignInDto(login: user.email, password: password));

    _userRepository.saveUser(user);
  }

  Future<void> signIn(String login, String password) async {
    _authProvider.signIn(SignInDto(login: login, password: password));
  }
}
