import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/presentation/widgets/home_header.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.backgrounds,
    required this.borders,
  });

  final AppBackgrounds? backgrounds;
  final AppBorders? borders;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).extension<AppBorders>()!;
    return Column(
      children: [
        HomeHeader(backgrounds: backgrounds),
        Divider(
          color: border.transparent,
        ),
        Expanded(
          child: Center(
            child: Text(
              '',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
