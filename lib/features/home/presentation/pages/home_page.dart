import 'package:flutter/material.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_page_body.dart';
import 'package:student_hackerha/features/home/presentation/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

late AnimationController animationController;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: HomePageBody(
        animationController: animationController,
      ),
    );
  }
}
