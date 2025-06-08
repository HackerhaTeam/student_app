import 'package:flutter/material.dart';

String getThemeIcon(BuildContext context,String dark,String light) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return isDarkMode ?dark :light;
}