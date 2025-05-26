import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/DI/%20service_locator.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_cubit.dart';
import 'package:student_hackerha/core/themes/app_theme.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/sign_up_pages/sign_up_wrapper.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/search_courses/search_courses_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCoursesCubit(),
        ),
      ],
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
              locale: const Locale('ar'),
              supportedLocales: const [
                Locale('ar'),
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              home: ThemeSwitchingArea(
                child: BlocProvider(
                  create: (context) => SearchCoursesCubit(),
                  child: AuthWrapper(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
