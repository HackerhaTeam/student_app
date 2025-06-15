import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_hackerha/core/DI/service_locator.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/search_courses/search_courses_cubit.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_list.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_search_section.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchHeader(title: "البحث"),
              const SizedBox(height: 24),
              HomeSearchSection(
                searchController: textEditingController,
                onSearch: (query) => _handleSearch(context, query),
              ),
              _buildSearchResults(context, screenSize),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSearch(BuildContext context, String query) {
    final courses = locator.get<List<Course>>(instanceName: 'courses');
    context.read<SearchCoursesCubit>().searchCourses(query, courses);
  }

  Widget _buildSearchResults(BuildContext context, Size screenSize) {
    return BlocBuilder<SearchCoursesCubit, SearchCoursesState>(
      builder: (context, state) {
        return switch (state) {
          SearchCoursesInitial() => const InitialTextSearchPage(),
          SearchCoursesNotFound() => const NotFoundSearch(),
          SearchCoursesError(message: final message) =>
            _buildErrorWidget(context, message),
          SearchCoursesSuccess(filteredCourses: final courses) =>
            _buildCoursesList(context, screenSize, courses),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _buildErrorWidget(BuildContext context, String message) {
    return Center(
      child: Text(
        "$message عذرا حصل خطأ غير متوقع",
        style: context.xDisplayLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCoursesList(
      BuildContext context, Size screenSize, List<Course> courses) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w(context)),
      child: CourseList(
      
        courses: courses,
        scrollDirection: Axis.vertical,
        key: ValueKey(courses.length), // For better widget recycling
      ),
    );
  }
}

class NotFoundSearch extends StatelessWidget {
  const NotFoundSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        SizedBox(
          height: 37.h(context),
        ),
        SvgPicture.asset(
          isDark ? AppImages.searchLogoDark : AppImages.searchLogoLight,
          height: 306.h(context),
          width: 306.w(context),
        ),
        Text(
          "لا عمليات بحث مطابقة",
          style: context.xDisplayLarge,
        ),
        SizedBox(
          height: 8.h(context),
        ),
        SizedBox(
          width: 306.w(context),
          child: Text(
            "عذرًا، المادة غير متاحة حاليًا. تحقق من الاسم أو جرب مادة أخرى.",
            style: context.xParagraphLargeNormal.copyWith(
                color: Theme.of(context).extension<AppContent>()!.secondary),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class InitialTextSearchPage extends StatelessWidget {
  const InitialTextSearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 228.h(context),
        ),
        Center(
          child: Text(
            "ابحث واكتشف المواد التي تهمك بسهولة.",
            style: context.xParagraphLargeNormal.copyWith(
                color: Theme.of(context).extension<AppContent>()!.secondary),
          ),
        ),
      ],
    );
  }
}

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20.h(context), right: 20.w(context), left: 20.w(context)),
      child: Row(
        children: [
          CustomCircleIcon(
            backgroundColor: Theme.of(context).extension<AppBackgrounds>()!.onSurfaceSecondary,
            iconAsset: AppImages.carretRightLight,
            onTap: () {
              Navigator.pop(context);
            }, circleSize: 44.w(context),
          ),
          SizedBox(
            width: 8.w(context),
          ),
          Text(
            title,
            style: context.xHeadingLarge,
          ),
        ],
      ),
    );
  }
}
