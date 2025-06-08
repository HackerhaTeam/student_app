import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/core/widgets/tags/tag_item.dart';
import 'package:student_hackerha/core/widgets/tags/tags_list_view.dart';
import 'package:student_hackerha/features/archive/presentation/widgets/archive_list_view.dart';
import 'package:student_hackerha/features/archive/presentation/widgets/empty_state_view.dart';
import 'package:student_hackerha/features/archive/presentation/widgets/section/archive_tags_section.dart';

class ArchivePageBodyBuilder extends StatelessWidget {
  const ArchivePageBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagCubit, int>(
      builder: (context, state) {
        return Column(
          children: [
            ArchiveTagsSection(currentIndex: state),
            SizedBox(height: 24.h(context)),
            if (state == 1 || state == 2)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
                  child: ArchiveListView(
                    key: ValueKey('isBank-${state==2}'),
                    isBank: state == 2,
                  ),
                ),
              )
            else
              const EmptyStateView(),
          ],
        );
      },
    );
  }
}
