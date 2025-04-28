import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/home/presentation/manager/change_icon_cubit.dart';
import 'package:student_hackerha/features/home/presentation/widgets/drawer/advanced_theme_switcher.dart';

class DrawerHeadding extends StatelessWidget {
  final void Function()? onClose;

  const DrawerHeadding({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final contentColor = Theme.of(context).extension<AppContent>();
    final animationController = context.read<ChangeIconCubit>().controller;
    return Row(
      children: [
        GestureDetector(
          onTap: onClose,
          child: AnimatedIcon(
            color: contentColor!.brandPrimary,
            icon: AnimatedIcons.menu_close,
            progress: animationController,
          ),
        ),
        Text(
          "إغلاق",
          style:
              context.xLabelXLarge.copyWith(color: contentColor.brandPrimary),
        ),
        SizedBox(width: 12.w(context)),
        const Spacer(),
        AdvancedThemeSwitcher(),
      ],
    );
  }
}
