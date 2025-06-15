import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/core/widgets/tags/tag_item.dart';

class TagsListView extends StatelessWidget {
  const TagsListView({
    super.key,
    required this.selectedIndex, required this.tagsName,
  });

  final int selectedIndex;
  final List<String> tagsName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h(context)),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: tagsName.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(left: 8.w(context)),
            child: GestureDetector(
              onTap: () =>
                  context.read<TagCubit>().goToPage(index: index),
              child: TagItem(
                index: index,
                tagText: tagsName[index],
                isSelected: index == selectedIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
