import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    this.tabController,
    this.pageController,
    this.onTabChanged,
    this.isLinkedToPageView = false,
  });

  final List<String> tabs;
  final TabController? tabController;
  final PageController? pageController;
  final Function(int)? onTabChanged;
  final bool isLinkedToPageView;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _localTabController;

  @override
  void initState() {
    super.initState();

    // إنشاء controller محلي إذا لم يتم توفيره
    _localTabController = widget.tabController ??
        TabController(length: widget.tabs.length, vsync: this);

    if (widget.isLinkedToPageView) {
      _localTabController.addListener(_handleTabChange);
    }
  }

  @override
  void dispose() {
    if (widget.isLinkedToPageView) {
      _localTabController.removeListener(_handleTabChange);
    }

    // التخلص من الـ controller المحلي فقط إذا لم يتم توفيره من الخارج
    if (widget.tabController == null) {
      _localTabController.dispose();
    }
    super.dispose();
  }

  void _handleTabChange() {
    if (_localTabController.indexIsChanging && widget.pageController != null) {
      widget.pageController!.animateToPage(
        _localTabController.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    if (widget.onTabChanged != null) {
      widget.onTabChanged!(_localTabController.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;

    return TabBar(
    
      controller: _localTabController,
      tabs: widget.tabs
          .map((tab) => Tab(
                child: Padding(
                  padding: EdgeInsets.zero, 
                  child: Text(
                    tab,
                  ),
                ),
              ))
          .toList(),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: content.brandPrimary,
          width: 3.0,
        ),
        insets: EdgeInsets.zero,
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      labelColor: content.brandPrimary,
      labelStyle: context.xLabelMedium.copyWith(
        letterSpacing: 0,
      ),
      unselectedLabelStyle: context.xLabelMedium.copyWith(
        color: content.secondary,
        letterSpacing: 0,
      ),
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      dividerColor: Colors.transparent,
      onTap: !widget.isLinkedToPageView
          ? (index) {
              if (widget.onTabChanged != null) {
                widget.onTabChanged!(index);
              }
            }
          : null,
    );
  }
}
