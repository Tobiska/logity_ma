import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RuPhoneInputFormatter extends TextInputFormatter {
  //форматированный телефон
  String _formattedPhone = "";
  //Российский ли номер
  bool _isRu = false;

  //Добавляем возможность указать номер по дефолту
  RuPhoneInputFormatter({
    String? initialText,
  }) {
    if (initialText != null) {
      formatEditUpdate(
          TextEditingValue.empty, TextEditingValue(text: initialText));
    }
  }

  ///Иетод возвращает форматированнный телефон
  String getMaskedPhone() {
    return _formattedPhone;
  }

  ///возвращает чистый телефон. для России начинается с 9
  String getClearPhone() {
    if (_formattedPhone.isEmpty) {
      return '';
    }
    if (!_isRu) {
      return _formattedPhone.replaceAll(RegExp(r'\D'), '');
    }
    return _formattedPhone.replaceAll(RegExp(r'\D'), '').substring(
        1,
        (_formattedPhone.replaceAll(RegExp(r'\D'), '').length >= 11)
            ? 11
            : _formattedPhone.replaceAll(RegExp(r'\D'), '').length);
  }

  ///Проверяет заполнил ли пользователь телефон. Актуально только для Российских телефонов
  bool isDone() {
    if (!_isRu) {
      return true;
    }
    return (_formattedPhone.replaceAll(RegExp(r'\D'), '').length > 10);
  }

  ///возвращает флаг Российски ли номер
  get isRussian => _isRu;

  String _formattingPhone(String text) {
    //регулярка протиа букв. в телефоне только цифры
    text = text.replaceAll(RegExp(r'\D'), '');
    if (text.isNotEmpty) {
      String phone = '';
      //проверяем российски ли номер
      if (['7', '8', '9'].contains(text[0])) {
        _isRu = true;
        //если пользователь начал с 9, то добавим 7
        if (text[0] == '9') {
          text = '7$text';
        }
        //Проверяем нужен ли +
        String firstSymbols = (text[0] == '8') ? '8' : '+7';
        //само форматирование
        phone = '$firstSymbols ';
        if (text.length > 1) {
          phone += '(${text.substring(1, (text.length < 4) ? text.length : 4)}';
        }
        if (text.length >= 5) {
          phone +=
              ') ${text.substring(4, (text.length < 7) ? text.length : 7)}';
        }
        if (text.length >= 8) {
          phone += '-${text.substring(7, (text.length < 9) ? text.length : 9)}';
        }
        if (text.length >= 10) {
          phone +=
              '-${text.substring(9, (text.length < 11) ? text.length : 11)}';
        }
        return phone;
      } else {
        _isRu = false;
        return '+$text';
      }
    }
    return '';
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');
    int selectionStart = oldValue.selection.end;

    //проверяем стерает ли пользователь все символы?
    if (oldValue.text == '${newValue.text} ') {
      _formattedPhone = '';
      return TextEditingValue(
          text: _formattedPhone,
          selection: TextSelection(
              baseOffset: _formattedPhone.length,
              extentOffset: _formattedPhone.length,
              affinity: newValue.selection.affinity,
              isDirectional: newValue.selection.isDirectional));
    }

    //проверяем редактирует ли пользователь телефон где то по середине?
    if (selectionStart != _formattedPhone.length) {
      _formattedPhone = _formattingPhone(text);
      //если да, то не перекидываем курсов в самый конец

      return TextEditingValue(
          text: _formattedPhone,
          selection: TextSelection(
              baseOffset: newValue.selection.baseOffset,
              extentOffset: newValue.selection.extentOffset,
              affinity: newValue.selection.affinity,
              isDirectional: newValue.selection.isDirectional));
    }

    _formattedPhone = _formattingPhone(text);

    //если пользователь просто вводит телефон,
    //то переносим курсор в конец форматированной строки
    return TextEditingValue(
        text: _formattedPhone,
        selection: TextSelection(
            baseOffset: _formattedPhone.length,
            extentOffset: _formattedPhone.length,
            affinity: newValue.selection.affinity,
            isDirectional: newValue.selection.isDirectional));
  }
}
