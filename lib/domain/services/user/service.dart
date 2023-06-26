import 'package:get_it/get_it.dart';
import 'package:logity_ma/domain/services/user/contract.dart';

import '../../entity/user.dart';

class UserService {
  final IUserProvider _userProvider;

  UserService() : _userProvider = GetIt.instance<IUserProvider>();

  Future<User> getMe() async {
    User user = await _userProvider.getMeInfo();
    return user;
  }
}
