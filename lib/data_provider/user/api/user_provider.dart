import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entity/user.dart';
import '../../../domain/services/user/contract.dart';
import '../../../domain/services/user/exceptions.dart';
import '../../authentication/api/auth_client.dart';
import 'models.dart';

class ApiUserProvider implements IUserProvider {
  final ApiAuthClient _client;
  ApiUserProvider() : _client = GetIt.instance<ApiAuthClient>();

  @override
  Future<User> getMeInfo() async {
    try {
      Response resp = await _client.dio.get("/me");
      ApiGetMeResponse dto = ApiGetMeResponse.fromJson(jsonDecode(resp.data));
      return User(id: dto.id, email: dto.email, phone: dto.phone, password: '');
    } on DioError catch (e) {
      throw GetMeErr();
    }
  }
}
