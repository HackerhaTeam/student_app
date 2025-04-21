import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

class CustomNextButtonItem extends StatelessWidget {
  const CustomNextButtonItem({
    super.key, required this.text, required this.icon, required this.textStyle,
  });
final String text;
final IconData icon; 
final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         text,
          style:textStyle,
        ),
        SizedBox(
          width: 4.w(context),
        ),
        PhosphorIcon(
          icon,
          color: contentColor.primaryInverted,
          size: 24.w(context),
        )
      ],
    );
  }


}
