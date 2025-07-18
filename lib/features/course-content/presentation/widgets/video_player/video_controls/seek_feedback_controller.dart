import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SeekFeedbackController {
  final TickerProvider vsync;
  late List<AnimationController> iconControllers;
  late List<Animation<Offset>> iconAnimations;

  SeekFeedbackController({required this.vsync}) {
    iconControllers = List.generate(3, (_) {
      return AnimationController(
        vsync: vsync,
        duration: const Duration(milliseconds: 300),
      );
    });

    iconAnimations = List.filled(3, const AlwaysStoppedAnimation(Offset.zero));
  }

  void dispose() {
    for (final controller in iconControllers) {
      controller.dispose();
    }
  }

  void startSeekAnimations(bool isForward, VoidCallback setStateCallback) {
    for (int i = 0; i < iconControllers.length; i++) {
      iconControllers[i].reset();
      Future.delayed(Duration(milliseconds: i * 100), () {
        iconControllers[i].forward();
        setStateCallback();
      });
    }

    iconAnimations = iconControllers.map((controller) {
      return Tween<Offset>(
        begin: Offset(isForward ? -0.3 : 0.3, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ));
    }).toList();
  }

  List<Animation<Offset>> get animations => iconAnimations;
}
