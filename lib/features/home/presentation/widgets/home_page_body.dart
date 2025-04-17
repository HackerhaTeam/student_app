import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/custom_textdiled.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_item.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_tag.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_header.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
    required this.backgrounds,
    required this.borders,
  });

  final AppBackgrounds? backgrounds;
  final AppBorders? borders;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int selectedTagIndex = 0;
  late TextEditingController _searchController;

  final List<String> tags = [
    "دورات جديدة",
    "خصومات",
    "دورات نظرية",
    "دورات عملية",
    "دورات شاملة"
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;

    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(backgrounds: background),
          Padding(
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
                  controller: _searchController,
                ),
                SizedBox(height: 24.h(context)),
                SizedBox(
                  height: 36.h(context),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: tags.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: 8.w(context)),
                        child: CoursesTag(
                          background: background,
                          appBorder: border,
                          text: tags[index],
                          isSelected: index == selectedTagIndex,
                          onTap: () => setState(() => selectedTagIndex = index),
                          borderColor: border.primaryBrand,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h(context)),
                _buildCoursesHeader(background),
                SizedBox(
                  height: 330.h(context),
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 50,
                    itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 330.h(context),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10.w(context),
                          right: index == 0
                              ? 20.w(context)
                              : 10.w(context), // مسافة إضافية للعنصر الأول
                        ),
                        child: CourseItem(
                          border: border,
                          background: background,
                          courseName: 'البرمجة (${index + 1})',
                          description: 'وصف الدورة رقم ${index + 1}',
                          tagsTitle: [
                            "مدرّس ${index + 1}",
                            "دورة شاملة",
                            "${index + 20} طالب"
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesHeader(AppBackgrounds background) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "عرض الكل",
            style: TextStyle(
              color: background.primaryBrand,
              fontSize: 14.fs(context),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "الدورات الجديدة",
            style: TextStyle(
              fontSize: 20.fs(context),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
