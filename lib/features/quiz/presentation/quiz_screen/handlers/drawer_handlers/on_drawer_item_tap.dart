import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/drawer_handlers/close_drawer.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/drawer_handlers/go_to_page.dart';

void onDrawerItemTap(
    {required int lastIndexAccess,
    required int index,
    required int selectedIndex,
    required BuildContext context,
    required bool isCorrection}) {

      
  if (!isCorrection) {
    if (lastIndexAccess >= index && index != selectedIndex) {
      goToPage(context, index);
      closeDrawer(context);
    }
  } else {
    goToPage(context, index);
    closeDrawer(context);
  }
}
