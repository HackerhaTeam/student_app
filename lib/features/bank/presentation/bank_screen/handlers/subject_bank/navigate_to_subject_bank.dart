
  import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/pages/subject_bank_page.dart';

void navigateToSubjectBank(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ThemeSwitchingArea(child: SubjectBankPage());
        },
      ),
    );
  }

