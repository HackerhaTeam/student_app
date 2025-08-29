import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class ShimmerSessionCard extends StatelessWidget {
  final double width;
  final double height;
  
  const ShimmerSessionCard({
    super.key,
    this.width = double.infinity,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
     final border = Theme.of(context).extension<AppBorders>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    return Shimmer.fromColors(
      baseColor:Theme.of(context).extension<AppBackgrounds>()!.shemmerBg ,

      highlightColor: Colors.grey[100]!,
      period: const Duration(milliseconds: 1500),
      child: CustomCard(
         backgroundColor:  background.onSurfacePrimary,
      padding: EdgeInsets.all(16.w(context)),
      borderColor:  border.transparent,
      borderRadius: 12.w(context),
       
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // تأثير متلألئ للنص الأول
                  Container(
                    width: 60.w(context),
                    height: 14.w(context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.w(context)),
                    ),
                  ),
                  SizedBox(height: 4.w(context)),
                  // تأثير متلألئ للنص الثاني
                  Container(
                    width: 120.w(context),
                    height: 18.w(context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.w(context)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w(context)),
            // تأثير متلألئ للنص الثالث
            Container(
              width: 70.w(context),
              height: 14.w(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.w(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}