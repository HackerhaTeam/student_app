// Refactored version of the AccountTabPage code

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/home/presentation/widgets/myAccountPage/app_management_items.dart';
import 'package:student_hackerha/features/home/presentation/widgets/myAccountPage/menu_title.dart';
import 'package:student_hackerha/features/home/presentation/widgets/myAccountPage/mu_account_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/myAccountPage/my_information_list_tile.dart';
import 'package:student_hackerha/features/home/presentation/widgets/myAccountPage/session_files.dart';

class AccountTabPage extends StatelessWidget {
  const AccountTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const MuAccountHeader(),
              const SizedBox(height: 34),
              const MyInformationListTile(),
              const SizedBox(height: 24),
              const MenuTitle(title: "بياناتي"),
              const SizedBox(height: 16),
              const SessionFiles(),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(right: 20.w(context)),
                child: Text(
                  "إدارة التطبيق",
                  style: context.xHeadingLarge,
                ),
              ),
              const SizedBox(height: 16),
              const AppManagementItems(),
            ],
          ),
        ),
      ),
    );
  }
}
