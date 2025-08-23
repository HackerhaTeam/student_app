// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/core/widgets/gradient_divider.dart';
import 'package:student_hackerha/core/widgets/rounded_square_icon.dart';
import 'package:student_hackerha/features/notifications/presentation/helpers/get_notification_icon.dart';

class NotificationsCardBuilder extends StatelessWidget {
  const NotificationsCardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List notifications = [
      {
        "type": "alert",
        "title": "انتهت فترة اشتراكك في الدورة",
        "subtitle": "انتهت فترة تفعيل الدورة. يمكنك تجديدها متى شئت.",
        "time": "6:15 م",
        "date": "23/5/2025"
      },
      {
        "type": "new",
        "title": "ميزة جديدة متاحة!",
        "subtitle": "بات بإمكانك القيام بإبداء إعجابك بالمراجعات الأخرى!",
        "time": "11:44 ص",
        "date": "23/5/2025"
      },
      {
        "type": "success",
        "title": "تمت عملية الدفع بنجاح!",
        "subtitle": "تمت عملية شراء الدورة بنجاح، انطلق وهكرها الآن!",
        "time": "10:00 ص",
        "date": "23/5/2025"
      },
      {
        "type": "discount",
        "title": "عروض وتخفيضات!",
        "subtitle": "يمكنك عرض العروض الجديدة في قسم الدورات الآن!",
        "time": "10:00 ص",
        "date": "24/5/2025"
      },
      {
        "type": "connection",
        "title": "التواصل والدعم",
        "subtitle": "شكراً على تواصلك معنا، سنزودك بالتفاصيل قريباً.",
        "time": "06:00 م",
        "date": "24/5/2025"
      }
    ];
    final border = Theme.of(context).extension<AppBorders>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    return CustomCard(
      borderRadius: 16.r(context),
      borderColor: border.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          notifications.length,
          (index) {
            final Notification = notifications[index];
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: getNotificationIcon(Notification['type'], context),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Text(
                            Notification['title'],
                            style: context.xLabelMedium,
                          ),
                          Spacer(),
                          Text(
                            Notification['time'],
                            style: context.xLabelSmall
                                .copyWith(color: content.secondary),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      Notification['subtitle'],
                      style: context.xParagraphSmall
                          .copyWith(color: content.secondary),
                    ),
                  ),
                ),
                if (index < notifications.length - 1) GradientDivider(),
              ],
            );
          },
        ),
      ),
    );
  }
}



// Row(
//                     children: [
//                       getNotificationIcon(Notification['type'], context),
//                       Column(children: [
//                         Row(children: [],),
//                         Text("")
//                       ],)
//                     ],
//                   )