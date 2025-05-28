
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/widgets/sections/subject_bank_body.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/widgets/sections/subject_bank_header.dart';

class SubjectBankContent extends StatelessWidget {
  const SubjectBankContent({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w(context), vertical: 20.h(context)),
      child: Column(
        children: [
          SubjectBankHeader(),
          SizedBox(height: 32.h(context)),
          Expanded(child: SubjectBankBody()),
        ],
      ),
    );
  }
}