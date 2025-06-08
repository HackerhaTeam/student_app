import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/section/banks_section.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/section/tags_section.dart';

class BankPageBodyBuilder extends StatefulWidget {
  const BankPageBodyBuilder({super.key});

  @override
  State<BankPageBodyBuilder> createState() => _BankPageBodyBuilderState();
}

class _BankPageBodyBuilderState extends State<BankPageBodyBuilder> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TagCubit, int>(
      listener: (context, state) {
        _pageController.jumpToPage(state);
      },
      builder: (context, state) {
        return Column(
          children: [
            TagsSection(
              selectedIndex: state,
            ),
            SizedBox(height: 24.h(context)),
            Expanded(
              child: BanksSection(
                controller: _pageController,
              ),
            ),
          ],
        );
      },
    );
  }
}
