import 'package:get_it/get_it.dart';
import 'package:logity_ma/domain/services/user/contract.dart';
import 'package:logity_ma/domain/services/user/dto.dart';

import '../../entity/user.dart';

class UserService {
  final IUserStorage _userRepository;
  final IAuthProvider _authProvider;
  final IUserProvider _userProvider;

  UserService()
      : _userRepository = GetIt.instance<IUserStorage>(),
        _authProvider = GetIt.instance<IAuthProvider>(),
        _userProvider = GetIt.instance<IUserProvider>();

  Future<void> signUpByEmail(
      String email, String password, String confirmPassword) async {
    User user = await _authProvider.signUpByEmail(SignUpByEmailDto(
        email: email, password: password, confirmPassword: confirmPassword));

    await _authProvider
        .signIn(SignInDto(login: user.email!, password: password));

    _userRepository.saveUser(user);
  }

  Future<void> signIn(String login, String password) async {
    await _authProvider.signIn(SignInDto(login: login, password: password));
  }

  Future<User> getMe() async {
    User user = await _userProvider.getMeInfo();
    _userRepository.saveUser(user);
    return user;
  }
}
