import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logity_ma/presentation/welcome/bloc/welcome_bloc.dart';
import 'package:logity_ma/presentation/welcome/bloc/welcome_event.dart';

import '../bloc/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: BlocListener<WelcomeBloc, WelcomeState>(
        listener: (context, state) {
          if (state.goToState == WelcomeRouteEnum.WelcomePage) {
            return;
          }
          if (state.goToState == WelcomeRouteEnum.RegistrationPage) {
            Navigator.pushNamed(context, '/registration');
          } else if (state.goToState == WelcomeRouteEnum.LoginPage) {
            //todo push to login
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _LogoText(),
                Column(
                  children: [
                    _WelcomeText(),
                    _LogoImage(),
                    _LoginButton(),
                    _RegistrationButton()
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 13),
      child: const Text(
        'Logity',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 13),
      child: const Text(
        'Добро пожаловать',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 32,
        ),
      ),
    );
  }
}

class _LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/logo.png",
      width: 200,
      height: 200,
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      constraints: const BoxConstraints(minWidth: 299, minHeight: 70),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: const Color.fromRGBO(217, 217, 217, 1)),
        onPressed: () {
          BlocProvider.of<WelcomeBloc>(context).add(WelcomeEventRegistration());
        },
        child: const Text(
          'Войти',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class _RegistrationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      constraints: const BoxConstraints(minWidth: 299, minHeight: 70),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Color.fromRGBO(217, 217, 217, 1)),
        onPressed: () {
          BlocProvider.of<WelcomeBloc>(context).add(WelcomeEventRegistration());
        },
        child: const Text(
          'Создать аккаунт',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
