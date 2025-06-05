import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/features/home/presentation/manager/change_icon_cubit.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    AnimationController animationController =
        BlocProvider.of<ChangeIconCubit>(context).controller;

    bool isopen = false;
    void iconTaped() {
      if (!isopen) {
        animationController.forward();
        isopen = true;
      } else {
        animationController.reverse();
        isopen = false;
      }
    }

    return Padding(
      padding: EdgeInsets.only(
          top: 20.h(context), right: 20.w(context), left: 20.w(context)),
      child: Row(
        children: [
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                iconTaped();
                Scaffold.of(context).openDrawer();
              },
              child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: animationController),
            );
          }),
          const Spacer(),
          Text(
            'الرئيسية',
            style: context.xHeadingLarge,
          ),
          const Spacer(),
          CustomCircleIcon(
                     iconAsset: AppImages.carretRight,

          //  icon: PhosphorIcons.bellSimple(),
            backgroundColor: background.onSurfaceSecondary,
            onTap: () {}, circleSize:44.w(context) ,
          ),
        ],
      ),
    );
  }
}
