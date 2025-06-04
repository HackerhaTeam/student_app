import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/drawer_list_view.dart';

class Drawercrollbar extends StatefulWidget {
  const Drawercrollbar({
    super.key, required this.isCorrection,
  });

final bool isCorrection;
  @override
  State<Drawercrollbar> createState() => _DrawercrollbarState();
}

class _DrawercrollbarState extends State<Drawercrollbar> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    return RawScrollbar(
      thumbColor: backgroundColor.muted,
      trackColor: backgroundColor.onSurfaceSecondary,
      controller: _controller,
      thumbVisibility: true,
      trackVisibility: true,
      thickness: 4,
      radius: Radius.circular(100),
      scrollbarOrientation: ScrollbarOrientation.right,
      child: DrawerListView(
        controller: _controller, isCorrection: widget.isCorrection,
      ),
    );
  }
}
