import 'dart:async';
import 'package:flutter/widgets.dart';

mixin AutoHideController<T extends StatefulWidget> on State<T> {
  Timer? _hideTimer;

  void startAutoHide(Duration duration, VoidCallback onHide) {
    _hideTimer?.cancel();
    _hideTimer = Timer(duration, () {
      if (mounted) {
        onHide();
      }
    });
  }

  void cancelAutoHide() {
    _hideTimer?.cancel();
  }

  void disposeAutoHide() {
    _hideTimer?.cancel();
  }
}
