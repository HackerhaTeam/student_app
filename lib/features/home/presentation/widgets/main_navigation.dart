import 'package:flutter/material.dart';
import 'package:student_hackerha/features/home/presentation/widgets/account_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/animated_navbar.dart';
import 'package:student_hackerha/features/home/presentation/widgets/archive_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_page_body.dart';
import 'package:student_hackerha/features/home/presentation/widgets/my_drawer.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({
    super.key,
  });
  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late AnimationController animationController;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _pages = [
      HomePageBody(animationController: animationController),
      CoursesTabPage(),
      ArchiveTabPage(),
      AccountTabPage(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    animationController.dispose();
    super.dispose();
  }

  bool isopen = false;
  void iconTaped(isOpened) {
    if (!isOpened) {
      animationController.reverse();
      isopen = true;
    } else {
      animationController.forward();
      isopen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onEndDrawerChanged: (isOpened) {
        iconTaped(isOpened);
      },
      endDrawer: MyDrawer(
        animationController: animationController,
      ),
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
