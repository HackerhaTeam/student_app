

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_hackerha/core/DI/service_locator.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/tags/tags_list_view.dart';
import 'package:student_hackerha/features/courses/presentation/pages/search_page.dart';
import 'package:student_hackerha/core/widgets/course%20card/my_course_list_section.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_list.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/home_search_section.dart';
import 'package:student_hackerha/features/home/presentation/widgets/monthly_trainer_page_view.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int selectedTagIndex = 0;
  late TextEditingController _searchController;

  final List<String> tags = [
    "دورات جديدة",
    "خصومات",
    "دورات نظرية",
    "دورات عملية",
    "دورات شاملة"
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final courses = locator.get<List<Course>>(instanceName: 'courses');

    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
  
  
   

    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: HomeHeader()),
        SliverToBoxAdapter(
          child: HomePageText(),
        ),
        SliverToBoxAdapter(
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.navigateWithSlideTransition(SearchPage());
                },
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                 
                
                child: HomeSearchSection(
                  searchController: _searchController,
                )),
              ),
     
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<TagCubit, int>(
            builder: (context, state) {
              return TagsListView(selectedIndex: state, tagsName: tags);
            },
          ),
        ),
       
        SliverToBoxAdapter(
          child: CoursesHeader(
            title: "الدورات الجديدة",
            onPressed: () {},
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: CourseList(
           
            courses: courses, scrollDirection:  Axis.horizontal,
          ),
        ),SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CoursesHeader(
            title: "دوراتي المسجل بها",
            onPressed: () {},
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: MyCourseListSection(
            border: border,
            background: background,
            courses: courses,
          ),
        ),SliverToBoxAdapter(
          child: SizedBox(
            height: 24 ,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(right: 20.w(context)),
            child: Text(
              "مدرسي الشهر",
              style: context.xHeadingLarge,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: MonthlyTrainerPageView(
            border: border,
            bg: background,
            borders: border,
          ),
        )
      ]),
    );
  }
}

class HomePageText extends StatelessWidget {
  const HomePageText({
    super.key,
  });


  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        SizedBox(height: 24),
        SvgPicture.asset(
         getThemeIcon(context,  AppImages.homeTextDark,  AppImages.homeTextLight ),
          width: 372.w(context),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
