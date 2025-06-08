import 'package:flutter/material.dart';
import 'package:student_hackerha/core/widgets/tags/tags_list_view.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/helpers/tags/get_tags.dart';

class TagsSection extends StatelessWidget {
  const TagsSection({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return TagsListView(
      selectedIndex: selectedIndex, tagsName: getBankTags(),
    );
  }
}
