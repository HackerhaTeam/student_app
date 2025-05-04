import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class MotivationPhrase extends StatelessWidget {
  const MotivationPhrase({
    super.key,
    required this.percentage,
  });
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _getTitleText(percentage),
          style: context.xDisplayLarge,
        ),
        Text(
          textAlign: TextAlign.center,
          _getContetnText(percentage),
          style: context.xParagraphLargeNormal
        ),
      ],
    );
  }

  String _getTitleText(double percentage) {
    if (percentage <= 20) {
      return 'لا بأس ، كل بداية صعبة';
    } else if (percentage <= 40) {
      return 'أنت على الطريق';
    } else if (percentage <= 60) {
      return 'أداء جيد !';
    } else if (percentage <= 80) {
      return 'عمل رائع !';
    } else if (percentage <= 99) {
      return 'ممتاز جدًا !';
    } else {
      return 'أحسنت !';
    }
  }

  String _getContetnText(double percentage) {
    if (percentage <= 20) {
      return 'لم يكن هذا أفضل أدائك ، لكن لا تيأس ! تعلّم من أخطائك وسترى التحسن بسرعة';
    } else if (percentage <= 40) {
      return 'بدأت البداية ، وهذا هو الأهم ! استمر بالمحاولة، الخطوة القادمة ستكون أفضل';
    } else if (percentage <= 60) {
      return 'قطعت نصف الطريق ، والقادم أفضل ! تابع التدريب ، فأنت تقترب من التميز';
    } else if (percentage <= 80) {
      return 'أداؤك يُظهر فهمًا جيدًا ، استمر بهذا المستوى وادفع بنفسك إلى القمة';
    } else if (percentage <= 99) {
      return 'نتيجتك مبهرة ، يبدو أنك بذلت جهدًا واضحًا واصل هكذا';
    } else {
      return 'أداؤك رائع ! استمر الآن وواصل التقدم نحو مستويات أعلى دائمًا';
    }
  }
}
