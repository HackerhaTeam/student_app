import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CourseImage extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final bool isNew;
  final String url;

  const CourseImage({
    super.key,
    required this.border,
    required this.background,
    required this.isNew,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(21.r(context)),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CachedNetworkImage(
            imageUrl: url,
            width: double.infinity,
            height: 140,
            fit: BoxFit.fill,

            // shimmer أثناء التحميل
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: double.infinity,
                height: 140,
                color: Colors.grey,
              ),
            ),

            // إذا فشل التحميل → صورة افتراضية
            errorWidget: (context, url, error) => Image.asset(
         AppImages.courseImage, // ضع مسار الصورة الافتراضية من عندك
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),

          if (isNew)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 60.w(context),
                color: background.negativeStrong,
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "جديد",
                    style: context.xLabelSmall.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
