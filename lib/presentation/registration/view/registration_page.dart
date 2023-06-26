import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:logity_ma/presentation/common/border.dart';
import 'package:logity_ma/presentation/common/text_style.dart';

import '../../common/margin.dart';
import '../models/phone_formatter.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: kCommonPageMargin,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  _RegistrationText(),
                  _DirectionText(),
                ],
              ),
              Column(
                children: [
                  _PhoneTextField(),
                  _EmailTextField(),
                  _PasswordTextField(),
                  _Button(text: 'Продолжить')
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegistrationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 13),
      child: const Text(
        'Регистрация',
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

class _DirectionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 13),
      child: const Text(
        'Введите ваш номер телефона, логин и пароль',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _PhoneTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      constraints: const BoxConstraints(minWidth: 299, minHeight: 70),
      child: TextField(
        keyboardType: TextInputType.phone,
        autocorrect: false,
        cursorColor: kCursorColor,
        style: TextStyle(fontSize: 24),
        inputFormatters: [RuPhoneInputFormatter()],
        decoration: InputDecoration(
          enabledBorder: kTextFieldBorderEnable,
          focusedBorder: kTextFieldBorderFocused,
          contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 10),
          fillColor: Color.fromRGBO(217, 217, 217, 1),
          filled: true,
          hintText: "Phone",
        ),
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      constraints: const BoxConstraints(minWidth: 299, minHeight: 70),
      child: TextField(
        style: const TextStyle(fontSize: 24),
        cursorColor: kCursorColor,
        decoration: InputDecoration(
          enabledBorder: kTextFieldBorderEnable,
          focusedBorder: kTextFieldBorderFocused,
          contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 10),
          fillColor: Color.fromRGBO(217, 217, 217, 1),
          filled: true,
          hintText: "Email",
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      constraints: const BoxConstraints(minWidth: 299, minHeight: 70),
      child: TextField(
        style: TextStyle(fontSize: 24),
        cursorColor: kCursorColor,
        decoration: InputDecoration(
          enabledBorder: kTextFieldBorderEnable,
          focusedBorder: kTextFieldBorderFocused,
          contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 10),
          fillColor: Color.fromRGBO(217, 217, 217, 1),
          filled: true,
          hintText: "Password",
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;

  _Button({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      constraints: const BoxConstraints(minWidth: 310, minHeight: 70),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Color.fromRGBO(163, 163, 163, 1)),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
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
