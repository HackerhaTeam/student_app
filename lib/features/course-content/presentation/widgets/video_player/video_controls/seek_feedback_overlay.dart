import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SeekFeedbackOverlay extends StatelessWidget {
  final bool isForward;
  final List<Animation<Offset>> iconAnimations;

  const SeekFeedbackOverlay({
    super.key,
    required this.isForward,
    required this.iconAnimations,
  });

  @override
  Widget build(BuildContext context) {
    final double radius = 80;

    return Align(
      alignment: isForward ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.only(
            topLeft: isForward ? Radius.circular(radius) : Radius.zero,
            bottomLeft: isForward ? Radius.circular(radius) : Radius.zero,
            topRight: !isForward ? Radius.circular(radius) : Radius.zero,
            bottomRight: !isForward ? Radius.circular(radius) : Radius.zero,
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
                    position: iconAnimations[i],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: PhosphorIcon(
                        isForward
                            ? PhosphorIcons.caretDoubleLeft()
                            : PhosphorIcons.caretDoubleRight(),
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 8),
              Text(
                isForward ? '+10 sec' : '-10 sec',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






/**
 * Align(
              alignment:
                  _isForward ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
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
            )
 */