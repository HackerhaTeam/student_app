// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/float_next_button_with_dialog.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/activation_code_field.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/contact_us.dart';
import 'package:student_hackerha/features/course-content/presentation/pages/course_content_page.dart';

class ActiveCoursePageBody extends StatefulWidget {
  const ActiveCoursePageBody({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<ActiveCoursePageBody> createState() => _ActiveCoursePageBodyState();
}

class _ActiveCoursePageBodyState extends State<ActiveCoursePageBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final FocusNode codeFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      codeFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = context;
    final content = Theme.of(context).extension<AppContent>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    return Scaffold(
      floatingActionButton: FloatNextButtonWithDialog(
        formKey: formKey,
        nextPage: CourseContentPage(),
        title: "تم تفعيل الدورة بنجاح!",
        subtitle:
            "بات الآن بإنمكانك الصول لمحتوى هذه الدورة كاملة، انطلق وهكر المادة معنا الآن!",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w(context),
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              IntroductionHeader(
                  introText: " أدخل رمز التفعيل", icon: PhosphorIcons.numpad()),
              Padding(
                padding: EdgeInsets.only(top: 8.h(context)),
                child: Text(
                  "لتفعيل هذه الدورة والوصول للمحتوى فيها بشكل كامل يرجى إدخال كود التفعيل أدناه.",
                  style: styles.xParagraphLargeLose,
                ),
              ),
              SizedBox(
                height: 32.h(context),
              ),
              ActivationCodeField(
                  codeFocusNode: codeFocusNode,
                  border: border,
                  numberController: numberController),
              SizedBox(
                height: 32.h(context),
              ),
              ContactUs(content: content)
            ],
          ),
        ),
      ),
    );
  }
}
