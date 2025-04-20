import 'package:flutter/material.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_tabpage.dart';
import 'package:student_hackerha/features/home/presentation/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      endDrawer: MyDrawer(),
      body: HomeTabPage(),
    );
  }
}
