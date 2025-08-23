import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CenterPlayPauseButton extends StatelessWidget {
  final VideoPlayerController controller;
  final AnimationController animationController;
  final VoidCallback onTap;

  const CenterPlayPauseButton({
    super.key,
    required this.controller,
    required this.animationController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(12),
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: animationController,
            size: 44,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
