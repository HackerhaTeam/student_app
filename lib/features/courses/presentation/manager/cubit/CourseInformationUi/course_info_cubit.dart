import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/CourseInformationUi/course_info_state.dart';

class CourseInfoCubit extends Cubit<CourseInfoState> {
  final ScrollController scrollController;
  late final TabController tabController;

  final aboutKey = GlobalKey();
  final teachersKey = GlobalKey();
  final contentKey = GlobalKey();
  final reviewsKey = GlobalKey();

  final scrollViewKey = GlobalKey(); // مضاف جديد

  CourseInfoCubit(TickerProvider vsync)
      : scrollController = ScrollController(),
        super(const CourseInfoState(
          showTabBar: false,
          isTabChanging: false,
          currentTabIndex: 0,
        )) {
    tabController = TabController(length: 4, vsync: vsync);
    tabController.addListener(_handleTabChange);
    scrollController.addListener(_handleScroll);
  }

  void _handleTabChange() {
    if (tabController.indexIsChanging) {
      emit(state.copyWith(currentTabIndex: tabController.index));
    }
  }

  void _handleScroll() {
    final offset = scrollController.offset;

    // إظهار أو إخفاء الـ TabBar العلوي عند التمرير
    if (offset > 250 && !state.showTabBar) {
      emit(state.copyWith(showTabBar: true));
    } else if (offset <= 250 && state.showTabBar) {
      emit(state.copyWith(showTabBar: false));
    }

    _updateTabIndexBasedOnSection();
  }

  void _updateTabIndexBasedOnSection() {
    if (state.isTabChanging) return;

    final scrollViewContext = scrollViewKey.currentContext;
    if (scrollViewContext == null) return;

    final scrollViewBox =
        scrollViewContext.findRenderObject() as RenderBox;

    final sectionKeys = [
      aboutKey,
      teachersKey,
      contentKey,
      reviewsKey,
    ];

    for (int i = 0; i < sectionKeys.length; i++) {
      final sectionContext = sectionKeys[i].currentContext;
      if (sectionContext == null) continue;

      final box = sectionContext.findRenderObject() as RenderBox;
      final position =
          box.localToGlobal(Offset.zero, ancestor: scrollViewBox);

      if (position.dy <= 150 && position.dy >= -200) {
        if (tabController.index != i) {
          tabController.animateTo(i);
          emit(state.copyWith(currentTabIndex: i));
        }
        break;
      }
    }
  }

  void scrollToSection(int index) {
    final keys = [aboutKey, teachersKey, contentKey, reviewsKey];
    final context = keys[index].currentContext;

    if (context != null) {
      emit(state.copyWith(isTabChanging: true));

      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      ).then((_) {
        Future.delayed(const Duration(milliseconds: 200), () {
          emit(state.copyWith(isTabChanging: false));
        });
      });
    }
  }

  @override
  Future<void> close() {
    tabController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
