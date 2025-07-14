import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

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
    with TickerProviderStateMixin {
  bool _showOverlay = true;
  Timer? _hideTimer;
  late AnimationController _animationController;

  bool _showSeekFeedback = false;
  bool _isForward = true;
  late List<AnimationController> _iconControllers;
  late List<Animation<Offset>> _iconAnimations;

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

    _iconControllers = List.generate(3, (_) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      );
    });

    _iconAnimations = List.filled(3, const AlwaysStoppedAnimation(Offset.zero));
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdate);
    _hideTimer?.cancel();
    _animationController.dispose();
    for (final controller in _iconControllers) {
      controller.dispose();
    }
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
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showOverlay = false);
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

    for (int i = 0; i < _iconControllers.length; i++) {
      _iconControllers[i].reset();
      Future.delayed(Duration(milliseconds: i * 100), () {
        if (mounted) _iconControllers[i].forward();
      });
    }
    _iconAnimations = _iconControllers.map((controller) {
      return Tween<Offset>(
        begin: Offset(_isForward ? -0.3 : 0.3, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ));
    }).toList();

    _startHideTimer();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final double radius = 80;

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
            Align(
              alignment:
                  _isForward ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.only(
                    topLeft: _isForward ? Radius.circular(radius) : Radius.zero,
                    bottomLeft:
                        _isForward ? Radius.circular(radius) : Radius.zero,
                    topRight:
                        !_isForward ? Radius.circular(radius) : Radius.zero,
                    bottomRight:
                        !_isForward ? Radius.circular(radius) : Radius.zero,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(3, (i) {
                          return SlideTransition(
                            position: _iconAnimations[i],
                            child: Opacity(
                              opacity: _showSeekFeedback ? 1 : 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                child: PhosphorIcon(
                                  _isForward
                                      ? PhosphorIcons.caretDoubleLeft()
                                      : PhosphorIcons.caretDoubleRight(),
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isForward ? '+10 sec' : '-10 sec',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (_showOverlay)
            Center(
              child: GestureDetector(
                onTap: () {
                  if (widget.controller.value.isPlaying) {
                    widget.controller.pause();
                  } else {
                    widget.controller.play();
                  }
                  _startHideTimer();
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: _animationController,
                    size: 44,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          if (_showOverlay)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 40.w(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(72.r(context)),
                    color: background.onSurfaceTransparent,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          _formatDuration(
                            _isDragging
                                ? Duration(milliseconds: _sliderValue!.toInt())
                                : widget.controller.value.position,
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 2.5,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 6.0),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 12.0),
                              activeTrackColor: content.brandPrimary,
                              inactiveTrackColor:
                                  background.containerStatic.withOpacity(0.5),
                              thumbColor: Colors.white,
                              overlayColor: Colors.white.withOpacity(0.2),
                            ),
                            child: Slider(
                              min: 0,
                              max: widget
                                  .controller.value.duration.inMilliseconds
                                  .toDouble(),
                              value: _isDragging
                                  ? _sliderValue!.clamp(
                                      0,
                                      widget.controller.value.duration
                                          .inMilliseconds
                                          .toDouble(),
                                    )
                                  : widget
                                      .controller.value.position.inMilliseconds
                                      .clamp(
                                        0,
                                        widget.controller.value.duration
                                            .inMilliseconds,
                                      )
                                      .toDouble(),
                              onChangeStart: (value) {
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
                                  widget
                                      .controller.value.duration.inMilliseconds
                                      .toDouble(),
                                );
                                widget.controller.seekTo(
                                    Duration(milliseconds: clamped.toInt()));
                                setState(() {
                                  _isDragging = false;
                                });
                                _startHideTimer();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _formatDuration(widget.controller.value.duration),
                          style: const TextStyle(color: Colors.white),
                        ),
                        IconButton(
                          icon: const Icon(Icons.hd, color: Colors.white),
                          onPressed: widget.onSelectQuality,
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.fullscreen, color: Colors.white),
                          onPressed: widget.onExitFullScreen,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
