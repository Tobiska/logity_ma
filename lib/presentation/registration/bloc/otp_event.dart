part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class OtpEventInitialize implements OtpEvent {}

class OtpEventSendCode implements OtpEvent {}

class OtpEventEditCode implements OtpEvent {
  final String code;
  OtpEventEditCode({required this.code});
}
