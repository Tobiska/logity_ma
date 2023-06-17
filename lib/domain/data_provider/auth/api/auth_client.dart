import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:logity_ma/domain/data_provider/auth/api/auth_provider.dart';
import 'package:logity_ma/domain/data_provider/auth/api/models.dart';
import 'package:logity_ma/domain/services/user/exceptions.dart';

import '../../../entity/auth.dart';

class ApiAuthClient {
  late Dio _dio;
  final ApiAuthProvider provider;

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  ApiAuthClient(this.provider) {
    _dio = Dio(BaseOptions(baseUrl: FlutterConfig.get("APP_BACKEND_HOST")));
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      _setAuthenticationRequest(options);
      handler.next(options);
    }, onError: (error, handler) async {
      if (error.response?.statusCode == 401) {
        await _refreshToken();
        await _retry(error.requestOptions);
      }
      handler.next(error);
    }));
  }

  void _setAuthenticationRequest(RequestOptions opt) async {
    Token accessToken;
    try {
      accessToken = await provider.tokenStorage.loadAccessToken();
    } on AuthAccessTokenErr catch (_) {
      _refreshToken();
      accessToken = await provider.tokenStorage.loadAccessToken();
    }
    opt.headers['Authorization'] = 'Bearer ${accessToken.token}';
  }

  Future<void> _refreshToken() async {
    Token refreshToken = await provider.tokenStorage.loadRefreshToken();
    Response resp = await _dio.post("/auth/refresh",
        options: Options(
            headers: {"Authorization": 'Bearer ${refreshToken.token}'}));
    provider.tokenStorage
        .saveAccessToken(ApiToken.fromJson(resp.data).toDomain());
  }
}
