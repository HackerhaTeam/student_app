import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/DI/%20service_locator.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_cubit.dart';
import 'package:student_hackerha/core/themes/app_theme.dart';
import 'package:student_hackerha/features/home/presentation/widgets/navbar/main_navigation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:student_hackerha/features/Enroll-Course/presentation/pages/enroll_pages_wraper.dart';

void main() {
  setupDependencies();
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return ThemeProvider(
          duration: Duration(milliseconds: 500),
          initTheme: AppTheme.light,
          builder: (_, myTheme) {
            return MaterialApp(
              locale: Locale('ar'),
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('ar', ''), // Arabic
                const Locale('en', ''), // English
              ],
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              home: MainNavigationPage(),
            );
          },
        return MaterialApp(
          locale: const Locale('ar'),
          supportedLocales: const [
            Locale('ar'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          theme: AppTheme.light,
          darkTheme: AppTheme.light,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Theme with Cubit"),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.brightness_6),
      //       onPressed: () {
      //         context.read<ThemeCubit>().toggleTheme();
      //       },
      //     ),
      //   ],
      // ),
      body: EnrollCourseWraper(),
    );
  }
}
