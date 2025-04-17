import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_tag.dart';

class CourseItem extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final String courseName;
  final String description;
  final List<String> tagsTitle;

  const CourseItem({
    super.key,
    required this.border,
    required this.background,
    required this.courseName,
    required this.description,
    required this.tagsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330.h(context),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.r(context)),
          border: Border.all(width: 1, color: border.secondary),
        ),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(21.r(context)),
                  topRight: Radius.circular(21.r(context)),
                ),
                child: Image.asset(
                  AppImages.courseImage,
                  width: double.infinity,
                  height: 140.h(context),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.w(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      courseName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.fs(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h(context)),
                    Text(
                      description,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 14.fs(context),
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12.h(context)),
                    SizedBox(
                      height: 36.h(context),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tagsTitle.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(left: 8.w(context)),
                            child: CoursesTag(
                              background: background,
                              appBorder: border,
                              text: tagsTitle[index],
                              isSelected: false,
                              borderColor: Colors.transparent,
                              backgroundColor: border.transparentStatic,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h(context)),
                    Center(
                      child: CustomButton(
                        onPressed: () {},
                        borderRadius: 12.r(context),
                        color: border.primaryBrand,
                        height: 38.h(context),
                        width: double.infinity,
                        child: Text(
                          "عرض التفاصيل",
                          style: TextStyle(
                            color: background.surfacePrimary,
                            fontSize: 12.fs(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
