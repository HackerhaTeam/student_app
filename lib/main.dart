import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/app_theme.dart';
import 'package:student_hackerha/features/home/presentation/pages/home_page.dart';
import 'package:student_hackerha/features/home/presentation/widgets/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: MainNavigationPage(),
    );
  }
}
