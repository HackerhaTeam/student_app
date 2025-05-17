import 'package:flutter/material.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/widgets/sections/subject_bank_content.dart';

class SubjectBankPage extends StatelessWidget {
  const SubjectBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SubjectBankContent()));
  }
}


