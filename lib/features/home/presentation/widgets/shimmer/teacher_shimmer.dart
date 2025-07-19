import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class TeacherShimmer extends StatelessWidget {
  const TeacherShimmer({
    super.key,
    required this.border,
  });

  final AppBorders border;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: Center(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: CustomCard(width: 279.w(context),
          borderRadius: 12.r(context),
          backgroundColor: Colors.white,
          borderColor: border.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // صورة المحامي الدائرية (placeholder)
                  Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // اسم المحامي
                  Container(
                    width: 100,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  // التخصص
                  Container(
                    width: 80,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // عدد القضايا
                  Container(width: 40, height: 14, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(width: 90.w(context), height: 1, color: Colors.white),
                  const SizedBox(height: 8),
                  // التقييم
                  Container(width: 60, height: 14, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(width: 90.w(context), height: 1, color: Colors.white),
                  const SizedBox(height: 8),
                  // سنوات الخبرة
                  Container(width: 40, height: 14, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
          )),
    );
  }
}