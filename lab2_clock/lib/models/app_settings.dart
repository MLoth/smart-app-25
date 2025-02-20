import 'package:flutter/material.dart';

class AppSettings {
  String clockStyle;
  String clockFormat;
  String showFocusTimer;
  Color themeColor;

  AppSettings({
    required this.clockStyle,
    required this.clockFormat,
    required this.showFocusTimer,
    required this.themeColor,
  });
}
