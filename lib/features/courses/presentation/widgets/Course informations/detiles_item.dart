import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
  
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/icon_text.dart';

class DetilesItem extends StatelessWidget {
  const DetilesItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final PhosphorIconData icon;
  @override
  Widget build(BuildContext context) {
 
    final border = Theme.of(context).extension<AppBorders>()!;

    return CustomCard(
      
      
      padding: EdgeInsets.all(16.w(context)),
      width: 182.w(context),
      borderColor: border.transparent,
      borderRadius:   12.w(context),
      
      child: Wrap(
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          IconText(icon: icon, title: title,mainAxisAlignment: MainAxisAlignment.start,),
          SizedBox(
            width: double.infinity,
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: context.xDisplaySmall,
          ),
        ],
      ),
    );
  }
}
