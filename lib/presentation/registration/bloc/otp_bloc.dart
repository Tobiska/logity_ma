import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpEventInitialize>(_onInitialize);
    on<OtpEventEditCode>(_onEditCode);
    on<OtpEventSendCode>(_onSendCode);

    add(OtpEventInitialize());
  }

  _onInitialize(OtpEventInitialize event, Emitter<OtpState> emit) {
    emit(state);
  }

  _onEditCode(OtpEventEditCode event, Emitter<OtpState> emit) {
    emit(OtpEditState(event.code));
  }

  _onSendCode(OtpEventSendCode event, Emitter<OtpState> emit) {
    emit(state);
  }
}
