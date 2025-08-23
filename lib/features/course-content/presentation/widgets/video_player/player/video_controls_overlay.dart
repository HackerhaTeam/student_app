import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/video_controls/seek_feedback_overlay.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

import '../video_controls/bottom_controls_bar.dart';
import '../video_controls/format_duration.dart';
import '../video_controls/play_pause_button.dart';
import '../video_controls/seek_feedback_controller.dart';
import '../video_controls/auto_hide_controller.dart';

class VideoControlsOverlay extends StatefulWidget {
  final VideoPlayerController controller;
  final VoidCallback onSelectQuality;
  final VoidCallback onExitFullScreen;

  const VideoControlsOverlay({
    super.key,
    required this.controller,
    required this.onSelectQuality,
    required this.onExitFullScreen,
  });

  @override
  State<VideoControlsOverlay> createState() => _VideoControlsOverlayState();
}

class _VideoControlsOverlayState extends State<VideoControlsOverlay>
    with TickerProviderStateMixin, AutoHideController {
  bool _showOverlay = true;
  Timer? _hideTimer;
  late AnimationController _animationController;

  bool _showSeekFeedback = false;
  bool _isForward = true;
  late SeekFeedbackController _seekController;

  double? _sliderValue;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerUpdate);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    if (widget.controller.value.isPlaying) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    _startHideTimer();

    _seekController = SeekFeedbackController(vsync: this);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdate);
    _hideTimer?.cancel();
    _animationController.dispose();
    _seekController.dispose();
    disposeAutoHide();

    super.dispose();
  }

  void _onControllerUpdate() {
    if (!mounted) return;

    final isPlaying = widget.controller.value.isPlaying;
    final animationCompleted =
        _animationController.status == AnimationStatus.completed;
    final animationDismissed =
        _animationController.status == AnimationStatus.dismissed;

    if (isPlaying && animationDismissed) {
      _animationController.forward();
    } else if (!isPlaying && animationCompleted) {
      _animationController.reverse();
    }

    if (!_isDragging) {
      setState(() {});
    }
  }

  void _toggleOverlayVisibility() {
    setState(() => _showOverlay = !_showOverlay);
    if (_showOverlay) _startHideTimer();
  }

  void _startHideTimer() {
    startAutoHide(const Duration(seconds: 3), () {
      setState(() => _showOverlay = false);
    });
  }

  void _seekBy(Duration offset, bool isForward) {
    final pos = widget.controller.value.position;
    final duration = widget.controller.value.duration;
    final newPosition = pos + offset;
    final clampedPosition = newPosition < Duration.zero
        ? Duration.zero
        : (newPosition > duration ? duration : newPosition);
    widget.controller.seekTo(clampedPosition);

    setState(() {
      _isForward = isForward;
      _showSeekFeedback = true;
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() => _showSeekFeedback = false);
      }
    });

    _seekController.startSeekAnimations(isForward, () {
      if (mounted) setState(() {});
    });

    _startHideTimer();
  }

  @override
  Widget build(BuildContext context) {
    // final content = Theme.of(context).extension<AppContent>()!;
    // final background = Theme.of(context).extension<AppBackgrounds>()!;
    // final double radius = 80;

    return GestureDetector(
      onTap: _toggleOverlayVisibility,
      onDoubleTapDown: (details) {
        final width = MediaQuery.of(context).size.width;
        final isRight = details.localPosition.dx > width / 2;
        _seekBy(
          isRight ? const Duration(seconds: 10) : const Duration(seconds: -10),
          isRight,
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          if (_showSeekFeedback)
            SeekFeedbackOverlay(
              isForward: _isForward,
              iconAnimations: _seekController.animations,
            ),
          if (_showOverlay)
            CenterPlayPauseButton(
              controller: widget.controller,
              animationController: _animationController,
              onTap: () {
                if (widget.controller.value.isPlaying) {
                  widget.controller.pause();
                } else {
                  widget.controller.play();
                }
                _startHideTimer();
              },
            ),
          if (_showOverlay)
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomControlsBar(
                sliderValue: _isDragging
                    ? _sliderValue!
                    : widget.controller.value.position.inMilliseconds
                        .toDouble(),
                isDragging: _isDragging,
                position: _isDragging
                    ? Duration(milliseconds: _sliderValue!.toInt())
                    : widget.controller.value.position,
                duration: widget.controller.value.duration,
                onChangeStart: (value) {
                  cancelAutoHide();
                  _hideTimer?.cancel();
                  setState(() {
                    _isDragging = true;
                    _sliderValue = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
                onChangeEnd: (value) {
                  final clamped = value.clamp(
                    0,
                    widget.controller.value.duration.inMilliseconds.toDouble(),
                  );
                  widget.controller
                      .seekTo(Duration(milliseconds: clamped.toInt()));
                  setState(() {
                    _isDragging = false;
                  });
                  _startHideTimer();
                },
                onSelectQuality: widget.onSelectQuality,
                onExitFullScreen: widget.onExitFullScreen,
              ),
            ),
        ],
      ),
    );
  }
}
