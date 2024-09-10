import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
