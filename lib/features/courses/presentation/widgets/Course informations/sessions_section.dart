import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/courses/domain/Entity/session.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/Courses/get_courses_cubit.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/session_card.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/shimmer_session_card.dart';

class SessionsSection extends StatelessWidget {
  const SessionsSection({
    super.key,
    required this.session,
  });
  final List<Session> session;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: session.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SessionCard(
              session: session[index], sessionIndex: index,
            ),
          ),
        );
  }
}
