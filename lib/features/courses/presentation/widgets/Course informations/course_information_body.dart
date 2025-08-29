import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/course_information_view.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/cubit/course_info_cubit.dart';

class CourseInformationBody extends StatefulWidget {
  const CourseInformationBody({super.key});

  @override
  State<CourseInformationBody> createState() => _CourseInformationBodyState();
}

class _CourseInformationBodyState extends State<CourseInformationBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseInfoCubit(this),
      child: const CourseInformationView(),
    );
  }
}