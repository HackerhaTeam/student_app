import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/manager/screen_shot_cubit/screen_shot_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/section/result_page_content.dart';
import 'package:student_hackerha/main.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    this.isBank = true,
  });
  final bool isBank;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScreenShotCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return Screenshot(
          controller: context.read<ScreenShotCubit>().controller,
          child: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (didPop) {
                return;
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (builder) {
                    return HomePage();
                  },
                ),
              );
            },
            child: SafeArea(
              child: Scaffold(
                body: ResultPageContent(isBank: isBank),
              ),
            ),
          ),
        );
      }),
    );
  }
}
