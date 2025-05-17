import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/handlers/subject_bank/navigate_to_subject_bank.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/subject_bank/subject_bank.dart';

class BankSubjectsView extends StatelessWidget {
  const BankSubjectsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h(context)),
          child: GestureDetector(
            onTap: () {
              navigateToSubjectBank(context);
            },
            child: SubjectBank(),
          ),
        );
      },
    );
  }
}
