//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CourseInfoPrice extends StatelessWidget {
  const CourseInfoPrice({super.key, required this.formattedPrice});
  final String formattedPrice;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: CourseInfoPriceView(formattedPrice: formattedPrice,),
      ),
    );
  }
}

class CourseInfoPriceView extends StatelessWidget {
  final String formattedPrice;

  const CourseInfoPriceView({
    super.key,
   required this.formattedPrice
  });



  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;

    return Column( crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("السعر", style: context.xLabelLarge.copyWith(color: content.secondary)),
        const SizedBox(height: 4),
        Text("$formattedPrice ل.س", style: context.xDisplayMedium.copyWith(color: content.success)),
      ],
    );
  }
}
