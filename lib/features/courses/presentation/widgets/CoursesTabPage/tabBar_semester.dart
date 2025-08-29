import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class TabBarSemester extends StatefulWidget {
  const TabBarSemester(
      {super.key, required this.tabController, required this.pageController});
  final TabController tabController;
  final PageController pageController;
  @override
  State<TabBarSemester> createState() => _TabBarSemesterState();
}

class _TabBarSemesterState extends State<TabBarSemester>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = ["الفصل الأول", "الفصل الثاني"];

  @override
  void initState() {
    widget.tabController.addListener(_handleTabChange);
    super.initState();
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_handleTabChange);
    widget.tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (widget.tabController.indexIsChanging) {
      widget.pageController.animateToPage(
        widget.tabController.index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;

    return TabBar(
      controller: widget.tabController,
      tabs: _tabs
          .map((tab) => Tab(
                text: tab,
              ))
          .toList(),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: content.brandPrimary,
          width: 3.0,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: content.brandPrimary,
      unselectedLabelColor: content.secondary,
      labelStyle: context.xLabelMedium,
      unselectedLabelStyle: context.xLabelMedium,
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      dividerColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 8.0.w(context)),
    );
  }
}
