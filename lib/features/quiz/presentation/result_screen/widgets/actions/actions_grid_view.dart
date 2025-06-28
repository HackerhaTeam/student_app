import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/handlers/actions/action_grid_view_helper.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/actions/actions_grid_view_item.dart';

class ActionsGridView extends StatelessWidget {
  const ActionsGridView({super.key, required this.isBank});
  final bool isBank;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        childAspectRatio: 1.17,
      ),
      itemCount: ActionGridViewHelper.iconsAssets(isBank: isBank).length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: ActionGridViewHelper.actionHandlers(context: context)[index],
          child: ActionsGridViewItem(
            iconAsset: ActionGridViewHelper.iconsAssets(isBank: isBank)[index],
            text: ActionGridViewHelper.labels(isBank: isBank)[index],
          ),
        );
      },
    );
  }
}
