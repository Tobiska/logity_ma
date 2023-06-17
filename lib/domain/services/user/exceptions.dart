import 'package:logity_ma/domain/entity/auth.dart';

class AuthErr implements Exception {}

class AuthUserNotAuthenticateErr implements AuthErr {
  @override
  String toString() {
    return "Пользователь не авторизован";
  }
}

class AuthAccessTokenErr implements Exception {}

class AuthAccessTokenNotExistErr implements AuthAccessTokenErr {
  @override
  String toString() {
    return "отсутствует access token";
  }
}

class AuthAccessTokenExpiredAtNotExistErr implements AuthAccessTokenErr {
  @override
  String toString() {
    return "отсутвует информация о истечении access token";
  }
}

class AuthAccessTokenExpiredErr implements AuthAccessTokenErr {
  @override
  String toString() {
    return "истёк access token";
  }
}

class AuthRefreshErr implements AuthErr {}

class AuthRefreshTokenNotExistErr implements AuthRefreshErr {
  @override
  String toString() {
    return "отсутcтвует refresh token";
  }
}

class AuthRefreshTokenExpiredAtNotExistErr implements AuthRefreshErr {
  @override
  String toString() {
    return "отсутвует информация о истечении access token";
  }
}

class AuthRefreshTokenExpiredErr implements AuthRefreshErr {
  @override
  String toString() {
    return "истёк refresh token";
  }
}

class AuthRtcErr implements AuthErr {}

class AuthRtcTokenNotExistErr implements AuthRtcErr {
  @override
  String toString() {
    return "отсутcтвует rtc token";
  }
}

class AuthRtcTokenExpiredAtNotExistErr implements AuthRtcErr {
  @override
  String toString() {
    return "отсутвует информация о истечении refresh token";
  }
}

class AuthRtcTokenExpiredErr implements AuthRtcErr {
  @override
  String toString() {
    return "истёк refresh token";
  }
}

class AuthSignUpByEmailErr implements Exception {}

class AuthSignInErr implements AuthErr {}
