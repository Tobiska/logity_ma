import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logity_ma/domain/data_provider/auth/api/models.dart';
import 'package:logity_ma/domain/entity/user.dart';
import 'package:logity_ma/domain/services/user/contract.dart';
import 'package:logity_ma/domain/services/user/dto.dart';
import 'package:flutter_config/flutter_config.dart';

import '../../../services/user/exceptions.dart';
import 'auth_client.dart';

class ApiAuthProvider implements IAuthProvider {
  final ITokensStorage _tokenStorage;
  late Dio _dio;

  ITokensStorage get tokenStorage => _tokenStorage;

  ApiAuthProvider() : _tokenStorage = GetIt.instance<ITokensStorage>() {
    _dio = Dio(BaseOptions(
      baseUrl: FlutterConfig.get("APP_BACKEND_HOST"),
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
  }

  @override
  Future<void> signIn(SignInDto dto) async {
    Response resp = await _dio.post("/auth/sign-in",
        data: ApiSignIn(dto.login, dto.password).toJson());

    if (resp.statusCode! ~/ 100 != 2) {
      throw AuthSignInErr;
    }

    ApiSignInResponse authResponse =
        ApiSignInResponse.fromJson(jsonDecode(resp.data));
    _tokenStorage.saveRtcToken(authResponse.rtcToken.toDomain());
    _tokenStorage.saveAccessToken(authResponse.accessToken.toDomain());
    _tokenStorage.saveRefreshToken(authResponse.refreshToken.toDomain());
  }

  @override
  Future<User> signUpByEmail(SignUpByEmailDto dto) async {
    try {
      Response resp = await _dio.post("/auth/sign-up",
          data: ApiSignUpByEmail(dto.email, dto.password, dto.confirmPassword)
              .toJson());
      if (resp.statusCode! ~/ 100 != 2) {
        throw AuthSignUpByEmailErr;
      }

      ApiSignUpByEmailResponse idResponse =
          ApiSignUpByEmailResponse.fromJson(jsonDecode(resp.data));
      return User(
          id: idResponse.userId, email: dto.email, phone: '', password: '');
    } on DioError catch (e) {
      throw AuthSignUpByEmailErr;
    }
  }

  @override
  Future<void> refreshSubscribes(SignUpByEmailDto dto) async {
    Response resp = await _dio.patch("/op/update-subscribes");
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

  @override
  Future<User> getMeInfo() {
    // TODO: implement getMeInfo
    throw UnimplementedError();
  }
}
