import 'package:json_annotation/json_annotation.dart';

import '../../../entity/auth.dart';

part 'models.g.dart';

@JsonSerializable()
class ApiSignUpByEmail {
  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "password")
  final String password;

  @JsonKey(name: "confirm_password")
  final String confirmPassword;

  ApiSignUpByEmail(this.email, this.password, this.confirmPassword);

  factory ApiSignUpByEmail.fromJson(Map<String, dynamic> json) =>
      _$ApiSignUpByEmailFromJson(json);
  Map<String, dynamic> toJson() => _$ApiSignUpByEmailToJson(this);
}

@JsonSerializable()
class ApiSignUpByEmailResponse {
  @JsonKey(name: "user_id")
  final String userId;

  ApiSignUpByEmailResponse(this.userId);

  factory ApiSignUpByEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiSignUpByEmailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiSignUpByEmailResponseToJson(this);
}

@JsonSerializable()
class ApiSignIn {
  @JsonKey(name: "login")
  final String login;

  @JsonKey(name: "password")
  final String password;

  ApiSignIn(this.login, this.password);

  factory ApiSignIn.fromJson(Map<String, dynamic> json) =>
      _$ApiSignInFromJson(json);
  Map<String, dynamic> toJson() => _$ApiSignInToJson(this);
}

@JsonSerializable()
class ApiSignInResponse {
  @JsonKey(name: "access_token")
  ApiToken accessToken;
  @JsonKey(name: "refresh_token")
  ApiToken refreshToken;
  @JsonKey(name: "rtc_token")
  ApiToken rtcToken;

  ApiSignInResponse(this.accessToken, this.refreshToken, this.rtcToken);

  factory ApiSignInResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiSignInResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiSignInResponseToJson(this);
}

@JsonSerializable()
class ApiToken {
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "expired_at")
  String expiredAt;

  ApiToken(this.token, this.expiredAt);

  factory ApiToken.fromJson(Map<String, dynamic> json) =>
      _$ApiTokenFromJson(json);
  Map<String, dynamic> toJson() => _$ApiTokenToJson(this);

  Token toDomain() {
    return Token.fromString(token: token, expiredAt: expiredAt);
  }
}
