import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({
    super.key,
    required this.nameFocusNode,
    required this.nameController,
  });

  final FocusNode nameFocusNode;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextField(
        focusNode: nameFocusNode,
        fieldType: FieldType.name,
        label: "الاسم الكامل",
        radius: 8.r(context),
        controller: nameController,
        width: 372,
        height: 57,
      ),
    );
  }
}
