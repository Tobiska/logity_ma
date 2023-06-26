import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logity_ma/presentation/welcome/bloc/welcome_event.dart';

enum WelcomeRouteEnum {
  RegistrationPage,
  WelcomePage,
  LoginPage,
}

class WelcomeState {
  final bool userIsExist;
  final String errorTitle;
  final WelcomeRouteEnum goToState;

  WelcomeState(
      {required this.userIsExist,
      required this.errorTitle,
      required this.goToState});

  WelcomeState.blank()
      : userIsExist = false,
        goToState = WelcomeRouteEnum.WelcomePage,
        errorTitle = "";

  WelcomeState copyWithRoute(goToState) {
    return WelcomeState(
        userIsExist: userIsExist, errorTitle: errorTitle, goToState: goToState);
  }
}

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState.blank()) {
    on<WelcomeEventRegistration>(_onRegistration);
    on<WelcomeEventLogin>(_onLogin);
    on<WelcomeEventInitialize>(_onInitialize);
    //todo впихнуть в input stream initialize event
  }

  _onInitialize(
      WelcomeEventInitialize event, Emitter<WelcomeState> emit) async {}

  _onRegistration(WelcomeEventRegistration event, Emitter<WelcomeState> emit) {
    emit(state.copyWithRoute(WelcomeRouteEnum.RegistrationPage));
  }

  _onLogin(WelcomeEventLogin event, Emitter<WelcomeState> emit) {
    emit(state.copyWithRoute(WelcomeRouteEnum.LoginPage));
  }
}
