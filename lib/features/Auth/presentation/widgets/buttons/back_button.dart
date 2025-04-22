import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_hackerha/core/constants/assets.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBack,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SvgPicture.asset(
        AppAssets.imagesIconsRightIcon,
        height: 44.h(context),
        width: 44.w(context),
      ),
    );
  }
}
