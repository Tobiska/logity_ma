import 'package:flutter/material.dart';

var kTextFieldBorderEnable = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(10.0),
);

var kTextFieldBorderFocused = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Colors.black,
    width: 2,
  ),
  borderRadius: BorderRadius.circular(10.0),
);
