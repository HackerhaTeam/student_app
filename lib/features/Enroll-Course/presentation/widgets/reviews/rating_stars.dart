import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: TextDirection.rtl,
      children: getStarsList(context: context, rating: rating),
    );
  }
}

class _RightToLeftClipper extends CustomClipper<Rect> {
  final double fillPercent;

  _RightToLeftClipper(this.fillPercent);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      size.width * (1 - fillPercent),
      0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(_RightToLeftClipper oldClipper) {
    return oldClipper.fillPercent != fillPercent;
  }
}

List<Widget> getStarsList(
    {required BuildContext context, required double rating}) {
  final contentColor = Theme.of(context).extension<AppContent>()!;

  List<Widget> stars = [];

  for (int i = 0; i < 5; i++) {
    double fillPercent = (rating - i).clamp(0.0, 1.0);

    stars.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Stack(
          children: [
            SvgPicture.asset(
              width: 16.s(context),
              height: 16.s(context),
              color: contentColor.warningSoft,
              AppImages.starFill,
            ),
            ClipRect(
              clipper: _RightToLeftClipper(fillPercent),
              child: SvgPicture.asset(
                width: 16.s(context),
                height: 16.s(context),
                AppImages.starFill,
                color: contentColor.warning,
              ),
            ),
          ],
        ),
      ),
    );
  }

  return stars;
}
