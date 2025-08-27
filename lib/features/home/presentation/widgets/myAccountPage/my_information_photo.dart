// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';

class MyInformationPhoto extends StatelessWidget {
  const MyInformationPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadiusGeometry.circular(24),
      child: Image.network(
      "https://static.photofeeler.com/images/home/test-box/01.jpg",
      width: 64,
      height: 64,
      
      ),
    )
;
  }
}
