import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

class BottomControlsBar extends StatelessWidget {
  final double sliderValue;
  final bool isDragging;
  final Duration position;
  final Duration duration;
  final ValueChanged<double> onChangeStart;
  final ValueChanged<double> onChanged;
  final ValueChanged<double> onChangeEnd;
  final VoidCallback onSelectQuality;
  final VoidCallback onExitFullScreen;

  const BottomControlsBar({
    super.key,
    required this.sliderValue,
    required this.isDragging,
    required this.position,
    required this.duration,
    required this.onChangeStart,
    required this.onChanged,
    required this.onChangeEnd,
    required this.onSelectQuality,
    required this.onExitFullScreen,
  });

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

    return Padding(
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text(
                _formatDuration(position),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2.5,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 12.0),
                    activeTrackColor: content.brandPrimary,
                    inactiveTrackColor:
                        background.containerStatic.withOpacity(0.5),
                    thumbColor: Colors.white,
                    overlayColor: Colors.white.withOpacity(0.2),
                  ),
                  child: Slider(
                    min: 0,
                    max: duration.inMilliseconds.toDouble(),
                    value: sliderValue.clamp(
                        0, duration.inMilliseconds.toDouble()),
                    onChangeStart: onChangeStart,
                    onChanged: onChanged,
                    onChangeEnd: onChangeEnd,
                  ),
                ),
              ),
              Text(
                _formatDuration(duration),
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: onExitFullScreen,
                child: PhosphorIcon(
                    size: 24, PhosphorIcons.cornersOut(), color: Colors.white),
              ),
              SizedBox(
                width: 8.w(context),
              ),
              GestureDetector(
                onTap: onSelectQuality,
                child: PhosphorIcon(
                    size: 24,
                    PhosphorIcons.dotsThreeVertical(),
                    color: Colors.white),
              ),
              SizedBox(
                width: 16.w(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
