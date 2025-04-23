import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/home/presentation/pages/home_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/notification_icon.dart';

class HomeHeader extends StatefulWidget {
  final AppBackgrounds? backgrounds;
  final AnimationController animationController;

  const HomeHeader({
    super.key,
    required this.backgrounds,
    required this.animationController,
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

  bool isopen = false;
  void iconTaped() {
    if (!isopen) {
      widget.animationController.forward();
      isopen = true;
    } else {
      widget.animationController.reverse();
      isopen = false;
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  progress: widget.animationController),
            );
          }),
          const Spacer(),
          Text(
            'الرئيسية',
            style: Theme.of(context).textTheme.xHeadingLarge,
          ),
          const Spacer(),
          NotificationIcon(backgrounds: widget.backgrounds),
        ],
      ),
    );
  }
}
