class CourseInfoState {
  final bool showTabBar;
  final bool isTabChanging;
  final int currentTabIndex;

  const CourseInfoState({
    required this.showTabBar,
    required this.isTabChanging,
    required this.currentTabIndex,
  });

  CourseInfoState copyWith({
    bool? showTabBar,
    bool? isTabChanging,
    int? currentTabIndex,
  }) {
    return CourseInfoState(
      showTabBar: showTabBar ?? this.showTabBar,
      isTabChanging: isTabChanging ?? this.isTabChanging,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
    );
  }
}