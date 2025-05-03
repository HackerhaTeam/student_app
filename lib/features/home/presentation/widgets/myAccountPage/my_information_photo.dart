// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';

class MyInformationPhoto extends StatelessWidget {
  const MyInformationPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w(context),
      height: 64,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: NetworkImage(
              "https://static.photofeeler.com/images/home/test-box/01.jpg"),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r(context)),
        ),
      ),
    );
  }
}
