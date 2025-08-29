import 'dart:math';

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/reviews/rating_stars.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
 Random random =Random.secure();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "المراجعات",
              style: context.xHeadingLarge,
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "عرض الكل",
                style: context.xLabelMedium
                    .copyWith(color: contentColor.brandPrimary),
              ),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            RatingStars(rating: 4.7),
            SizedBox(width: 8.w(context)),
            Text(
              '4.7',
              style:
                  context.xLabelMedium.copyWith(color: contentColor.secondary),
            )
          ],
        ),
        SizedBox(height: 8.h(context)),
        Text(
          '16 مراجعة',
          style:
              context.xParagraphMedium.copyWith(color: contentColor.secondary),
        ),
        ...List.generate(
          4,
          (index) => Padding(
            padding: EdgeInsets.only(top: 12.h(context)),
            child: CommentCard(rating:    random.nextInt(6).toDouble()),
          ),
        ),
      ],
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key, required this.rating,
  });
final double rating;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return CustomCard(borderColor: Theme.of(context).extension<AppBorders>()!.transparent,
      padding: EdgeInsets.symmetric(
          horizontal: 16.w(context), vertical: 16.h(context)),
      backgroundColor: backgroundColor.onSurfacePrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingStars(rating: rating),
          SizedBox(height: 12.h(context)),
          Text(
            'لقد كانت دورة البرمجة (1) التي قدمها أستاذ محمد المحمد تجربة تعليمية رائعة!',
            style: context.xParagraphMedium
                .copyWith(color: contentColor.secondary),
          ),
          SizedBox(height: 12.h(context)),
          Row(
            children: [
              SizedBox(
                width: 32.s(context),
                height: 32.s(context),
                child: CircleAvatar(
                    radius: 100.r(context),
                    child: Image.asset('assets/images/course_information.png')),
              ),
              SizedBox(width: 8.w(context)),
              Text(
                'منصور السالم',
                style: context.xLabelMedium
                    .copyWith(color: contentColor.secondary),
              ),
              Spacer(),
              Text(
                '15 / 6 / 2024',
                style: context.xLabelMedium
                    .copyWith(color: contentColor.secondary),
              ),
            ],
          )
        ],
      ),
    );
  }
}
