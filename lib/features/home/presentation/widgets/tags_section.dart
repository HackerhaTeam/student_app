import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_tag.dart';

class TagsSection extends StatelessWidget {
  final List<String> tags;
  final int selectedIndex;
  final void Function(int) onTagSelected;
  final AppBackgrounds background;
  final AppBorders border;

  const TagsSection({
    super.key,
    required this.tags,
    required this.selectedIndex,
    required this.onTagSelected,
    required this.background,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: SizedBox(
        height: 36.h(context),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tags.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 8.w(context)),
              child: CoursesTag(
                background: background,
                appBorder: border,
                text: tags[index],
                isSelected: index == selectedIndex,
                onTap: () => onTagSelected(index),
                borderColor: border.primaryBrand,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
