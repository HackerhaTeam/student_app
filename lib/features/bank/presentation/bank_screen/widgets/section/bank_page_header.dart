import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/bank/presentation/shared/widgets/custom_circle_icon.dart';

class BankPageHeader extends StatelessWidget {
  const BankPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('بنك الأسئلة', style: context.xHeadingXLarge),
          CustomCircleIconButton(
            backgrounds: backgroundColor,
            iconDataPhosphor: PhosphorIcons.magnifyingGlass(),
            size: 24.s(context),
          )
        ],
      ),
    );
  }
}
