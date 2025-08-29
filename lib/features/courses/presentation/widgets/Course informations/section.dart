//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class Section extends StatelessWidget {
  final GlobalKey scrollKey;
  final Widget child;

  const Section({required this.scrollKey, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
  
    return CustomCard(
   
      key: key,
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Container(
        key: scrollKey, 
        child: child,
      ),
    );
  }
}
