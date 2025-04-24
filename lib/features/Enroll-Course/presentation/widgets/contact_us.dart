// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
    required this.content,
  });

  final AppContent content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          style: TextStyle(fontSize: 16.fs(context)),
          "هل تواجه مشكلة؟ ",
        ),
        InkWell(
          child: Text(
            "راسلنا الآن",
            style: TextStyle(
                color: content.brandPrimary, fontSize: 16.fs(context)),
          ),
        )
      ],
    );
  }
}
