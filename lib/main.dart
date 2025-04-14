import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeConfig = Provider.of<ThemeConfig>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: themeConfig.themeMode,
      // theme: themeConfig.lightTheme,
      // darkTheme: themeConfig.darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
