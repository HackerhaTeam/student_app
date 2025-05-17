import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/section/bank_subjects_view.dart';

class BanksSection extends StatelessWidget {
  const BanksSection({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: BankSubjectsView(),
        );
      },
    );
  }
}
