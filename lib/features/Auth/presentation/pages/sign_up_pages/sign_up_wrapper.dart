import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/sign_up_pages/sign_up_page2.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/sign_up_pages/sign_up_page3.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/sign_up_pages/sign_up_page4.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/sign_up_pages/sign_up_page5.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/sign_up_pages/sign_up_page6.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/headers/auth_pages_header.dart';
import 'sign_up_page1.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final int _totalPages = 6;

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
                key: const PageStorageKey('auth_pages'),
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  SignUpPage1(
                    onNext: _goToNextPage,
                  ),
                  SignUpPage2(
                    onNext: _goToNextPage,
                  ),
                  SignUpPage3(onNext: _goToNextPage),
                  SignUpPage4(onNext: _goToNextPage),
                  SignUpPage5(onNext: _goToNextPage),
                  SignUpPage6(onNext: _goToNextPage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
