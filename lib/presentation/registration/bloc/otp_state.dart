part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpEditState extends OtpState {
  final String code;
  OtpEditState(this.code);
}
