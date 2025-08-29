import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/headers/custom_pages_header.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/pages/active_course_page.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/pages/enroll_course_page.dart';

class EnrollCourseWraper extends StatefulWidget {
  const EnrollCourseWraper({super.key});

  @override
  State<EnrollCourseWraper> createState() => _EnrollCourseWraperState();
}

class _EnrollCourseWraperState extends State<EnrollCourseWraper> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final int _totalPages = 2;

  double get _progress => (_currentPage + 1) / _totalPages;

  void _goToNextPage() {
    if (_currentPage < _totalPages - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;

    return Scaffold(
      backgroundColor: backgrounds.surfacePrimary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10.h(context),
            ),
            CustomPagesHeader(
              progress: _progress,
              backgrounds: backgrounds,
              onBack: () => _currentPage == 0
                  ? Navigator.pop(context)
                  : _goToPreviousPage(),
              currentPage: _currentPage,
              isAuth: false,
            ),
            // PageView
            Expanded(
              child: PageView(
                // key: const PageStorageKey('auth_pages'),
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  EnrollCoursePage(
                    onNext: _goToNextPage,
                  ),
                  ActiveCoursePage(onNext: _goToNextPage)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
