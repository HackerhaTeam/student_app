import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/helpers/action_grid_view_helper.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/actions/actions_grid_view_item.dart';

class ActionsGridView extends StatelessWidget {
  const ActionsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        childAspectRatio: 1.17,
      ),
      itemCount: ActionGridViewHelper.icons.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: ActionGridViewHelper.actionHandlers(context)[index],
          child: ActionsGridViewItem(
            icon: ActionGridViewHelper.icons[index],
            text: ActionGridViewHelper.labels[index],
          ),
        );
      },
    );
  }
}
