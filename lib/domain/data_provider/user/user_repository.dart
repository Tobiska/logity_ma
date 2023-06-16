import 'package:get_it/get_it.dart';
import 'package:logity_ma/domain/entity/user.dart';
import 'package:logity_ma/domain/services/user/contract.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage implements IUserStorage {
  @override
  Future<User> loadUser() async {
    final prefs = GetIt.instance<SharedPreferences>();

    String userId = prefs.getString("userId") ?? "";
    String email = prefs.getString("email") ?? "";
    String phone = prefs.getString("phone") ?? "";
    return User(id: userId, email: email, phone: phone, password: '');
  }

  @override
  Future<void> saveUser(User user) async {
    final prefs = GetIt.instance<SharedPreferences>();
    prefs.setString("email", user.email);
    prefs.setString("phone", user.phone);
  }
}
