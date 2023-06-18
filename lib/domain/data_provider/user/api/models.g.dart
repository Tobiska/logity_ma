// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGetMeResponse _$ApiGetMeResponseFromJson(Map<String, dynamic> json) =>
    ApiGetMeResponse(
      json['user_id'] as String,
      json['email'] as String?,
      json['phone'] as String?,
      json['fio'] as String,
    );

Map<String, dynamic> _$ApiGetMeResponseToJson(ApiGetMeResponse instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'fio': instance.fio,
    };
