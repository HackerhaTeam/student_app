import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/auth_page2.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/auth_page3.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/auth_page4.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/auth_pages_header.dart';
import 'auth_page1.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final int _totalPages = 4;

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
            AuthPagesHeader(
              progress: _progress,
              backgrounds: backgrounds,
              onBack: _goToPreviousPage,
              currentPage: _currentPage,
            ),
            // PageView
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  AuthPage1(
                    onNext: _goToNextPage,
                  ),
                  AuthPage2(
                    onNext: _goToNextPage,
                  ),
                  AuthPage3(onNext: _goToNextPage),
                  AuthPage4(onNext: _goToNextPage),
                  // AuthPage5(onNext: _goToNextPage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
