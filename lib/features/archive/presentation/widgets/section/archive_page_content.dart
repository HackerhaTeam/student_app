import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/subject_card/subject_card.dart';
import 'package:student_hackerha/core/widgets/tags/tags_list_view.dart';
import 'package:student_hackerha/features/archive/presentation/widgets/archive_list_view.dart';
import 'package:student_hackerha/features/archive/presentation/widgets/empty_state_view.dart';
import 'package:student_hackerha/features/archive/presentation/widgets/section/archive_page_body_builder.dart';
import 'package:student_hackerha/features/archive/presentation/widgets/section/archive_page_header.dart';

class ArchivePageContent extends StatelessWidget {
  const ArchivePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.only(top: 20.h(context)),
      child: Column(
        children: [
          ArchivePageHeader(),
          SizedBox(height: 24.h(context)),
          Expanded(child: ArchivePageBodyBuilder()),
        ],
      ),
    );
  }
}
