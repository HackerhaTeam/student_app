import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/core/widgets/tags/tag_item.dart';
class TagsListView extends StatelessWidget {
  const TagsListView({
    super.key,
    required this.selectedIndex,
    required this.tagsName,
  });

  final int selectedIndex;
  final List<String> tagsName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: SizedBox(
        height: 36.h(context),
        child: ListView.separated(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: tagsName.length,
          separatorBuilder: (_, __) => SizedBox(width: 8.w(context)),
          itemBuilder: (context, index) {
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => context.read<TagCubit>().updateIndex(index: index),
              child: TagItem(
                index: index,
                tagText: tagsName[index],
                isSelected: isSelected,
              ),
            );
          },
        ),
      ),
    );
  }
}