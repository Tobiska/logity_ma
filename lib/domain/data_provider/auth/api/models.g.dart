// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSignUpByEmail _$ApiSignUpByEmailFromJson(Map<String, dynamic> json) =>
    ApiSignUpByEmail(
      json['email'] as String,
      json['phone'] as String,
      json['password'] as String,
      json['confirm_password'] as String,
    );

Map<String, dynamic> _$ApiSignUpByEmailToJson(ApiSignUpByEmail instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
    };

ApiSignUpByEmailResponse _$ApiSignUpByEmailResponseFromJson(
        Map<String, dynamic> json) =>
    ApiSignUpByEmailResponse(
      json['id'] as String,
    );

Map<String, dynamic> _$ApiSignUpByEmailResponseToJson(
        ApiSignUpByEmailResponse instance) =>
    <String, dynamic>{
      'id': instance.userId,
    };

ApiSignIn _$ApiSignInFromJson(Map<String, dynamic> json) => ApiSignIn(
      json['login'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$ApiSignInToJson(ApiSignIn instance) => <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
    };

ApiSignInResponse _$ApiSignInResponseFromJson(Map<String, dynamic> json) =>
    ApiSignInResponse(
      ApiToken.fromJson(json['access_token'] as Map<String, dynamic>),
      ApiToken.fromJson(json['refresh_token'] as Map<String, dynamic>),
      ApiToken.fromJson(json['rtc_token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiSignInResponseToJson(ApiSignInResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'rtc_token': instance.rtcToken,
    };

ApiToken _$ApiTokenFromJson(Map<String, dynamic> json) => ApiToken(
      json['token'] as String,
      json['expired_at'] as String,
    );

Map<String, dynamic> _$ApiTokenToJson(ApiToken instance) => <String, dynamic>{
      'token': instance.token,
      'expired_at': instance.expiredAt,
    };
