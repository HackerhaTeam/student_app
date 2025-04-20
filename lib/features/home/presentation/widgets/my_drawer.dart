import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_cubit.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_state.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/home/presentation/widgets/custom_list_tile.dart';
import 'package:student_hackerha/features/home/presentation/widgets/gradient_divider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>();
    final contentColor = Theme.of(context).extension<AppContent>();
    return SafeArea(
      child: Drawer(
        backgroundColor: backgroundColor!.surfacePrimary,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 20.w(context), top: 72.h(context)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "إغلاق",
                      style: textTheme.xLabelXLarge
                          .copyWith(color: contentColor!.brandPrimary),
                    ),
                    SizedBox(
                      width: 12.w(context),
                    ),
                    PhosphorIcon(
                      PhosphorIcons.x(),
                      color: contentColor.brandPrimary,
                    ),
                  ],
                ),
                CircleAvatar(
                  minRadius: 64.r(context),
                  child: PhosphorIcon(
                    PhosphorIcons.user(),
                    size: 64,
                  ),
                ),
                SizedBox(
                  height: 24.h(context),
                ),
                Text(
                  "محمد المحمد",
                  style: textTheme.xLabelXLarge,
                ),
                SizedBox(
                  height: 24.h(context),
                ),
                GradientDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "القائمة",
                      style: textTheme.xHeadingSmall
                          .copyWith(color: contentColor.secondary),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h(context),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      CustomListTile(
                        phosphorIcondata: PhosphorIcons.user(),
                        title: "حسابي",
                        iconColor: contentColor.primary,
                        titleColor: contentColor.primary,
                      ),
                      CustomListTile(
                        phosphorIcondata: PhosphorIcons.magnifyingGlass(),
                        title: "البحث",
                        iconColor: contentColor.primary,
                        titleColor: contentColor.primary,
                      ),
                      CustomListTile(
                        phosphorIcondata:
                            PhosphorIcons.arrowsCounterClockwise(),
                        title: "تبديل الكلية",
                        iconColor: contentColor.primary,
                        titleColor: contentColor.primary,
                      ),
                      CustomListTile(
                        phosphorIcondata: PhosphorIcons.gift(),
                        title: "شارك رابط التطبيق",
                        iconColor: contentColor.primary,
                        titleColor: contentColor.primary,
                      ),
                      CustomListTile(
                        phosphorIcondata: PhosphorIcons.chatsTeardrop(),
                        title: "راسلنا",
                        iconColor: contentColor.primary,
                        titleColor: contentColor.primary,
                      ),
                      CustomListTile(
                        phosphorIcondata: PhosphorIcons.cardsThree(),
                        title: "إصدار 1.0.0",
                        iconColor: contentColor.secondary,
                        titleColor: contentColor.secondary,
                      ),
                      SizedBox(
                        height: 91.h(context),
                      ),
                      GradientDivider(),
                      CustomListTile(
                          phosphorIcondata: PhosphorIcons.signOut(),
                          title: "تسجيل الخروج",
                          iconColor: contentColor.negative,
                          titleColor: contentColor.negative),
                      SizedBox(
                        height: 16.h(context),
                      ),
                      GradientDivider(),
                      BlocBuilder<ThemeCubit, ThemeState>(
                        builder: (context, state) {
                          return CustomListTile(
                            phosphorIcondata: PhosphorIcons.moon(),
                            iconColor: contentColor.primary,
                            titleColor: contentColor.primary,
                            title: 'الوضع الداكن',
                            trailing: Switch(
                              activeColor: backgroundColor.disabled,
                              activeTrackColor: backgroundColor.fill,
                              value:
                                  state.isDarkMode, // الربط مع الحالة الفعلية
                              onChanged: (val) {
                                context
                                    .read<ThemeCubit>()
                                    .toggleTheme(); // التبديل عند الضغط
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 40.h(context),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
