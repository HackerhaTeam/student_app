 import 'package:flutter/material.dart';

void openDrawer(BuildContext context) {
    if (Scaffold.of(context).hasDrawer) {
      Scaffold.of(context).openDrawer();
    }
  }