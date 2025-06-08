import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/core/widgets/tags/tag_item.dart';
import 'package:student_hackerha/features/archive/presentation/helpers/archive_tag/get_archive_tags.dart';
import 'package:student_hackerha/features/archive/presentation/widgets/section/archive_page_body_builder.dart';

class ArchiveTagsSection extends StatelessWidget {
  const ArchiveTagsSection({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h(context)),
      child: SizedBox(
        height: 36.h(context),
        child: Row(
          children: List.generate(
            3,
            (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<TagCubit>().goToPage(index: index);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: index == 1 ? 8.h(context) : 0),
                    child: TagItem(
                        isSelected: currentIndex == index,
                        tagText: getArchiveTags()[index],
                        index: index),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
