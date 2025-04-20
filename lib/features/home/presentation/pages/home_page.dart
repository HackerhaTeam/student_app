import 'package:flutter/material.dart';
import 'package:student_hackerha/features/home/presentation/widgets/account_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/animated_navbar.dart';
import 'package:student_hackerha/features/home/presentation/widgets/archive_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_tab_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_tabpage.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onThemeChanged;
  final VoidCallback onLanguageChanged;
  final bool isDarkMode;
  final bool isArabic;

  const HomePage({
    super.key,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    required this.isDarkMode,
    required this.isArabic,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeTabPage(),
    );
  }
}
