import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/helpers/tags/get_tags.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/tags/tag_item.dart';

class TagsListView extends StatelessWidget {
  const TagsListView({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h(context)),
      child: SizedBox(
        height: 36.h(context),
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: getTags().length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(left: 8.w(context)),
            child: GestureDetector(
              onTap: () =>
                  context.read<TagCubit>().goToPage(index: index),
              child: TagItem(
                index: index,
                tagText: getTags()[index],
                isSelected: index == selectedIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
