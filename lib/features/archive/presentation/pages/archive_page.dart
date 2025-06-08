import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/features/archive/presentation/widgets/section/archive_page_content.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TagCubit(),
      child: SafeArea(
        child: Scaffold(
          body: ArchivePageContent(),
        ),
      ),
    );
  }
}
