
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/subject_card/subject_card.dart';

class ArchiveListView extends StatelessWidget {
  final bool isBank;

  const ArchiveListView({super.key, required this.isBank});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h(context)),
          child: SubjectCard(
            isBank: isBank,
          ),
        );
      },
    );
  }
}