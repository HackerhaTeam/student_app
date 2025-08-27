import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:student_hackerha/core/Entities/teacher.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/animation/fade_widget.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/features/home/presentation/manager/top%20teacher/top_teacher_cubit.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_section_builder.dart';
import 'package:student_hackerha/features/home/presentation/widgets/shimmer/teacher_shimmer.dart';

class MonthlyTrainerPageView extends StatefulWidget {
  const MonthlyTrainerPageView({
    super.key,
    required this.border,
    required this.bg,
    required this.borders,
  });

  final AppBorders border;
  final AppBackgrounds bg;
  final AppBorders borders;

  @override
  State<MonthlyTrainerPageView> createState() => _MonthlyTrainerPageViewState();
}

class _MonthlyTrainerPageViewState extends State<MonthlyTrainerPageView> {
  late final PageController _controller;
  late final Timer _timer;
  final int _pageCount = 2;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.8, keepPage: false);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_controller.hasClients) {
        _currentPage++;
        if (_currentPage >= _pageCount) _currentPage = 0;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
  return  Text("data"); 
 
}

}
