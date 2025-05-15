import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/manager/cubit/course_info_state.dart';

class CourseInfoCubit extends Cubit<CourseInfoState> {
  final ScrollController scrollController;
  late final TabController tabController;

  final aboutKey = GlobalKey();
  final teachersKey = GlobalKey();
  final contentKey = GlobalKey();
  final reviewsKey = GlobalKey();

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

    if (offset > 250 && !state.showTabBar) {
      emit(state.copyWith(showTabBar: true));
    } else if (offset <= 250 && state.showTabBar) {
      emit(state.copyWith(showTabBar: false));
    }

    _updateTabIndexBasedOnSection();
  }

  void _updateTabIndexBasedOnSection() {
    if (state.isTabChanging) return;

    final scrollOffset = scrollController.offset;

    final sectionOffsets = [
      aboutKey,
      teachersKey,
      contentKey,
      reviewsKey,
    ].map((key) {
      final context = key.currentContext;
      if (context == null) return double.infinity;
      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);
      return position.dy + scrollOffset;
    }).toList();

    for (int i = 0; i < sectionOffsets.length; i++) {
      if (scrollOffset >= sectionOffsets[i] - 200 &&
          (i == sectionOffsets.length - 1 ||
              scrollOffset < sectionOffsets[i + 1] - 200)) {
        if (tabController.index != i) {
          tabController.animateTo(i);
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