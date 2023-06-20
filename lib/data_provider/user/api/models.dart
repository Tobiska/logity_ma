import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class ApiGetMeResponse {
  @JsonKey(name: "user_id")
  final String id;

  @JsonKey(name: "email")
  final String? email;

  @JsonKey(name: "phone")
  final String? phone;

  @JsonKey(name: "fio")
  final String fio;

  ApiGetMeResponse(this.id, this.email, this.phone, this.fio);

  factory ApiGetMeResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiGetMeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiGetMeResponseToJson(this);
}
