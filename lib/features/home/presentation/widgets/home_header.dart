import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/home/presentation/manager/change_icon_cubit.dart';
import 'package:student_hackerha/core/widgets/circled_splash_icon.dart';

class HomeHeader extends StatefulWidget {
  final AppBackgrounds? backgrounds;

  const HomeHeader({
    super.key,
    required this.backgrounds,
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
          CircledSplashIcon(
            iconDataPhosphor: PhosphorIcons.bellSimple(),
          ),
        ],
      ),
    );
  }
}
