import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/builder/bank_page_body_builder.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/section/bank_page_header.dart';

class BankPageContent extends StatelessWidget {
  const BankPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h(context)),
      child: Column(
        children: [
          BankPageHeader(),
         
          Expanded(child: BankPageBodyBuilder())
        ],
      ),
    );
  }
}
