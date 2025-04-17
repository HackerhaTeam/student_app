import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_textdiled.dart';

class HomeSearchSection extends StatelessWidget {
  final AppBackgrounds background;
  final TextEditingController searchController;

  const HomeSearchSection({
    super.key,
    required this.background,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Column(
        children: [
          SizedBox(height: 24.h(context)),
          SvgPicture.asset(AppImages.homeText, width: 372.w(context)),
          SizedBox(height: 24.h(context)),
          CustomTextField(
            fieldType: FieldType.search,
            hint: "ابحث عن اسم مادة",
            radius: 8.r(context),
            suffixIcon: PhosphorIcons.magnifyingGlass(),
            controller: searchController,
          ),
          SizedBox(height: 24.h(context)),
        ],
      ),
    );
  }
}
