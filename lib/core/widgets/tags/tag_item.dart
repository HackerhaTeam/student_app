import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/helpers/tags/get_tag_backgroun_color.dart';
import 'package:student_hackerha/core/helpers/tags/get_tag_text_color.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';



class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.tagText,
    this.isSelected = false,
    required this.index,
  });

  final String tagText;
  final bool isSelected;

  final int index;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(
          horizontal: 16.w(context), vertical: 8.h(context)),
      duration: Duration(milliseconds: 300),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r(context)),
        color: getTagBackgroundColor(
            isSelected: isSelected, backgroundColor: backgroundColor),
        border: Border.all(color: backgroundColor.primaryBrand),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          tagText,
          style: context.xLabelMedium.copyWith(
            color: getTagTextColor(
              isSelected: isSelected,
              contentColor: contentColor,
            ),
          ),
        ),
      ),
    );
  }
}
