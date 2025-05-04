import 'package:flutter/widgets.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/section/result_page_actions_section.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/section/result_page_body_section.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/section/result_page_header_section.dart';

class ResultPageContent extends StatelessWidget {

  
  const ResultPageContent({super.key, });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w(context), vertical: 20.h(context)),
      child: Column(
        children: [
          ResultPageHeaderSection(),
          SizedBox(height: 34.h(context)),
          ResultPageBodySection( ),
          SizedBox(height: 32.h(context)),
          Expanded(child: ResultPageActionsSection()),
          
        ],
      ),
    );
  }
}
