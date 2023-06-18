import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logity_ma/domain/data_provider/auth/api/auth_client.dart';
import 'package:logity_ma/domain/data_provider/user/api/models.dart';
import 'package:logity_ma/domain/services/user/contract.dart';
import 'package:logity_ma/domain/services/user/exceptions.dart';

import '../../../entity/user.dart';

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
