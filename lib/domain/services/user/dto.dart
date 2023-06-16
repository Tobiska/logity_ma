class VerifyPhoneDto {
  String phone;

  VerifyPhoneDto({
    required this.phone,
  });
}

class SignUpByPhoneDto {
  String phone;
  String code;

  SignUpByPhoneDto({
    required this.phone,
    required this.code,
  });
}

class SignUpByEmailDto {
  String email;
  String password;
  String confirmPassword;

  SignUpByEmailDto({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class SignInDto {
  String login;
  String password;

  SignInDto({
    required this.login,
    required this.password,
  });
}
