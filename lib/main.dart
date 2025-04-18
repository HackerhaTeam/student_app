import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_cubit.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_state.dart';
import 'package:student_hackerha/core/themes/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:student_hackerha/features/Auth/presentation/pages/auth_page1.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/auth_wrapper.dart';

void main() {
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
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
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
      body: AuthWrapper(),
    );
  }
}
