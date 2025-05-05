import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({
    super.key,
    required this.nameFocusNode,
    required this.nameController,
    this.onSubmitted,
  });

  final FocusNode nameFocusNode;
  final TextEditingController nameController;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextField(
        focusNode: nameFocusNode,
        fieldType: FieldType.name,
        label: "الاسم الكامل",
        radius: 8.r(context),
        controller: nameController,
        width: 372.w(context),
        height: 57,
        onFieldSubmitted: onSubmitted,
      ),
    );
  }
}
