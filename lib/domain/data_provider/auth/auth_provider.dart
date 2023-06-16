import 'package:logity_ma/domain/entity/auth.dart';
import 'package:logity_ma/domain/entity/user.dart';
import 'package:logity_ma/domain/services/user/contract.dart';
import 'package:logity_ma/domain/services/user/dto.dart';

class ApiAuthProvider implements IAuthProvider {
  @override
  Future<Auth> signIn(SignInDto dto) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<User> signUpByEmail(SignUpByEmailDto dto) {
    // TODO: implement signUpByEmail
    throw UnimplementedError();
  }

  @override
  Future<User> signUpByPhone(SignUpByPhoneDto dto) {
    // TODO: implement signUpByPhone
    throw UnimplementedError();
  }

  @override
  Future<User> verifyPhone(VerifyPhoneDto dto) {
    // TODO: implement verifyPhone
    throw UnimplementedError();
  }
}
