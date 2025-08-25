import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/archive/presentation/pages/archive_page.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/pages/bank_page.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/features/home/presentation/manager/change_icon_cubit.dart';
import 'package:student_hackerha/features/home/presentation/pages/account_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/navbar/animated_navbar.dart';
import 'package:student_hackerha/features/courses/presentation/pages/courses_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_page_body.dart';
import 'package:student_hackerha/features/home/presentation/widgets/drawer/my_drawer.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late List<Widget> _pages;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late ChangeIconCubit _iconCubit;

  @override
  void initState() {
    super.initState();

    _iconCubit = ChangeIconCubit()..initController(this);

    _pages = [
      BlocProvider(
          create: (BuildContext context) => TagCubit(), child: HomePageBody()),
      BlocProvider(
          create: (BuildContext context) => TagCubit(),
          child: CoursesTabPage()),
      BankPage(),
      ArchivePage(),
      AccountTabPage(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _iconCubit,
      child: ThemeSwitchingArea(
        child: Scaffold(
          key: _scaffoldKey,
          onDrawerChanged: (isOpened) {
            _iconCubit.toggleAnimation(isOpened);
          },
          drawer: MyDrawer(
            animationController: _iconCubit.controller,
            onThemeChanged: () {
              if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
                _scaffoldKey.currentState?.openEndDrawer();
              }
            },
          ),
          body: PageView(
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
        ),
      ),
    );
  }
}
