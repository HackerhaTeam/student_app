import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/manager/bank_page_view_cubit/bank_page_view_cubit.dart';
import 'package:student_hackerha/features/bank/presentation/bank_screen/widgets/section/bank_page_content.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BankPageViewCubit()),
      ],
      child: SafeArea(
        child: Scaffold(
          body: BankPageContent(),
        ),
      ),
    );
  }
}
