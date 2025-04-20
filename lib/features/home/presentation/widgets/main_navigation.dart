import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/features/home/presentation/widgets/account_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/animated_navbar.dart';
import 'package:student_hackerha/features/home/presentation/widgets/archive_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_tabpage.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeTabPage(),
    CoursesTabPage(),
    ArchiveTabPage(),
    AccountTabPage(),
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        reverse: true,
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: AnimatedBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
          _pageController.jumpToPage(newIndex);
        },
      ),
    );
  }
}
