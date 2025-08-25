import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/text_field/custom_text_field.dart';
import 'package:student_hackerha/core/widgets/text_field/field_validators.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({
    super.key,
    required this.nameFocusNode,
    required this.nameController,
    this.onSubmitted,
    this.onChanged,
    required this.nameKey,
    required this.isNameSubmitted,
  });

  final FocusNode nameFocusNode;
  final TextEditingController nameController;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final GlobalKey<FormState> nameKey;
  final bool isNameSubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: nameKey,
      autovalidateMode: isNameSubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Center(
        child: CustomTextField(
          onChanged: onChanged,
          focusNode: nameFocusNode,
          fieldType: FieldType.name,
          label: "الاسم الكامل",
          radius: 8.r(context),
          controller: nameController,
          width: 372.w(context),
          // height: 57,
          onFieldSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
