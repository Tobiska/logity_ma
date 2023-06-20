import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:logity_ma/domain/data_provider/auth/api/auth_client.dart';
import 'package:logity_ma/domain/data_provider/auth/api/auth_provider.dart';
import 'package:logity_ma/domain/data_provider/auth/token_secure_storage.dart';
import 'package:logity_ma/domain/data_provider/user/api/user_provider.dart';
import 'package:logity_ma/domain/data_provider/user/user_storage.dart';
import 'package:logity_ma/domain/services/user/contract.dart';
import 'package:logity_ma/domain/services/user/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("auth", () {
    test('SingUpByEmail', () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterConfig.loadValueForTesting(
          {"APP_BACKEND_HOST": "http://localhost:8080"});
      SharedPreferences.setMockInitialValues({});

      GetIt.instance.registerSingletonAsync<SharedPreferences>(
          SharedPreferences.getInstance);
      GetIt.instance.registerSingletonWithDependencies<ITokensStorage>(
          () => TokenStorage(),
          dependsOn: [SharedPreferences]);
      GetIt.instance.registerSingletonWithDependencies<IAuthProvider>(
          () => ApiAuthProvider(),
          dependsOn: [SharedPreferences]);
      GetIt.instance.registerSingletonWithDependencies<IUserStorage>(
          () => UserStorage(),
          dependsOn: [SharedPreferences]);
      GetIt.instance.registerSingletonWithDependencies<ApiAuthClient>(
          () => ApiAuthClient(),
          dependsOn: [ITokensStorage, IAuthProvider]);
      GetIt.instance.registerSingletonWithDependencies<IUserProvider>(
          () => ApiUserProvider(),
          dependsOn: [ApiAuthClient]);

      await GetIt.instance.allReady();

      try {
        UserService srv = UserService();
        await srv.signUpByEmail("test@test.com", "testtest", "testtest");
      } on DioError catch (e) {
        fail(e.toString());
      }
    });

    test('SingIn', () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterConfig.loadValueForTesting(
          {"APP_BACKEND_HOST": "http://localhost:8080"});
      SharedPreferences.setMockInitialValues({});

      GetIt.instance.registerSingletonAsync<SharedPreferences>(
          SharedPreferences.getInstance);
      GetIt.instance.registerSingletonWithDependencies<ITokensStorage>(
          () => TokenStorage(),
          dependsOn: [SharedPreferences]);
      GetIt.instance.registerSingletonWithDependencies<IAuthProvider>(
          () => ApiAuthProvider(),
          dependsOn: [SharedPreferences]);
      GetIt.instance.registerSingletonWithDependencies<IUserStorage>(
          () => UserStorage(),
          dependsOn: [SharedPreferences]);
      GetIt.instance.registerSingletonWithDependencies<ApiAuthClient>(
          () => ApiAuthClient(),
          dependsOn: [ITokensStorage, IAuthProvider]);
      GetIt.instance.registerSingletonWithDependencies<IUserProvider>(
          () => ApiUserProvider(),
          dependsOn: [ApiAuthClient]);

      await GetIt.instance.allReady();

      try {
        UserService srv = UserService();
        await srv.signIn("test@test.com", "testtest");
      } on DioError catch (e) {
        fail(e.toString());
      }
    });

    test('GetMe', () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterConfig.loadValueForTesting(
          {"APP_BACKEND_HOST": "http://localhost:8080"});
      SharedPreferences.setMockInitialValues({});

      GetIt.instance.registerSingletonAsync<SharedPreferences>(
          SharedPreferences.getInstance);
      GetIt.instance.registerSingletonWithDependencies<ITokensStorage>(
          () => TokenStorage(),
          dependsOn: [SharedPreferences]);
      GetIt.instance.registerSingletonWithDependencies<IAuthProvider>(
          () => ApiAuthProvider(),
          dependsOn: [SharedPreferences]);
      GetIt.instance.registerSingletonWithDependencies<IUserStorage>(
          () => UserStorage(),
          dependsOn: [SharedPreferences]);
      GetIt.instance.registerSingletonWithDependencies<ApiAuthClient>(
          () => ApiAuthClient(),
          dependsOn: [ITokensStorage, IAuthProvider]);
      GetIt.instance.registerSingletonWithDependencies<IUserProvider>(
          () => ApiUserProvider(),
          dependsOn: [ApiAuthClient]);
      await GetIt.instance.allReady();

      try {
        UserService srv = UserService();
        await srv.signIn("test@test.com", "testtest");
        await srv.getMe();
      } on DioError catch (e) {
        fail(e.toString());
      }
    });
  });
}
