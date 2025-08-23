import 'package:flutter/material.dart';
import 'package:student_hackerha/features/course-content/presentation/widgets/video_player/basic/video_quality_option.dart';

void showQualityMenu({
  required BuildContext context,
  required List<VideoQualityOption> qualityOptions,
  required void Function(int index) onSelected,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.black.withOpacity(0.9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    builder: (_) => ListView.builder(
      itemCount: qualityOptions.length,
      itemBuilder: (ctx, index) {
        final option = qualityOptions[index];
        return ListTile(
          title:
              Text(option.label, style: const TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
            onSelected(index);
          },
        );
      },
    ),
  );
}
