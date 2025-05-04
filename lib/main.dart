import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_cubit.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_state.dart';
import 'package:student_hackerha/core/themes/app_theme.dart';
import 'package:student_hackerha/core/widgets/custom_icon_button.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/pages/quiz_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setup();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => BlocProvider(
        create: (_) => ThemeCubit(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: MaterialApp(
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              supportedLocales: const [
                Locale('ar'),
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              themeMode: state.themeMode,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              home: HomePage()),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الصفحة الرئيسية"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: CustomIconButton(
          onTap: () {
            final sessionManager = getIt.get<QuizSessionManerger>();

            sessionManager.startNewQuiz(quizData);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => QuizPage(),
              ),
            );
          },
          iconDataPhosphor: PhosphorIcons.play(),
          size: 60,
        ),
      ),
    );
  }
}
final Map<String, dynamic> quizData = {
  'quizTime': 15,
  'questionsList': [
    {
      'title': 'ما هي عاصمة فرنسا؟',
      'listChoices': ["برلين", "مدريد", "باريس", "روما"],
      'correctAnswer': 2,
    },
    {
      'title': 'ما هو أكبر كوكب في المجموعة الشمسية؟',
      'listChoices': ["الأرض", "المريخ", "المشتري", "زحل"],
      'correctAnswer': 2,
    },
    {
      'title': 'من هو مؤسس شركة مايكروسوفت؟',
      'listChoices': ["ستيف جوبز", "بيل غيتس", "إيلون ماسك", "مارك زوكربيرغ"],
      'correctAnswer': 1,
    },
    {
      'title': 'كم عدد ألوان قوس قزح؟',
      'listChoices': ["5", "6", "7", "8"],
      'correctAnswer': 2,
    },
    {
      'title': 'في أي قارة تقع مصر؟',
      'listChoices': ["آسيا", "أفريقيا", "أوروبا", "أمريكا الجنوبية"],
      'correctAnswer': 1,
    },
    {
      'title': 'ما هو الحيوان الذي يلقب بسفينة الصحراء؟',
      'listChoices': ["الحصان", "الجمل", "الماعز", "الأسد"],
      'correctAnswer': 1,
    },
    {
      'title': 'ما هو العنصر الكيميائي الذي رمزه O؟',
      'listChoices': ["ذهب", "أوكسجين", "فضة", "حديد"],
      'correctAnswer': 1,
    },
    {
      'title': 'من هو أول إنسان صعد إلى القمر؟',
      'listChoices': [
        "يوري جاجارين",
        "نيل آرمسترونغ",
        "باز ألدرن",
        "كريستوفر كولومبوس"
      ],
      'correctAnswer': 1,
    },
    {
      'title': 'ما هو أسرع حيوان بري؟',
      'listChoices': ["الأسد", "الفهد", "الغزال", "النمر"],
      'correctAnswer': 1,
    },
    {
      'title': 'كم عدد الكواكب في المجموعة الشمسية؟',
      'listChoices': ["7", "8", "9", "10"],
      'correctAnswer': 1,
    },
    {
      'title': 'ما هي اللغة الرسمية في البرازيل؟',
      'listChoices': ["الإسبانية", "الإنجليزية", "البرتغالية", "الفرنسية"],
      'correctAnswer': 2,
    },
    {
      'title': 'من مخترع المصباح الكهربائي؟',
      'listChoices': ["نيكولا تسلا", "توماس إديسون", "ألبرت أينشتاين", "ألكسندر غراهام بيل"],
      'correctAnswer': 1,
    },
    {
      'title': 'ما هو أطول نهر في العالم؟',
      'listChoices': ["الأمازون", "النيل", "اليانغتسي", "الدانوب"],
      'correctAnswer': 1,
    },
    {
      'title': 'أي من هذه الكواكب يُعرف بالكوكب الأحمر؟',
      'listChoices': ["المريخ", "عطارد", "الزهرة", "زحل"],
      'correctAnswer': 0,
    },
    {
      'title': 'ما هو اسم الكوكب الذي نعيش عليه؟',
      'listChoices': ["الأرض", "المريخ", "الزهرة", "نبتون"],
      'correctAnswer': 0,
    },
    {
      'title': 'من هو الرسام الذي رسم لوحة الموناليزا؟',
      'listChoices': ["ليوناردو دافنشي", "بيكاسو", "فان جوخ", "رامبرانت"],
      'correctAnswer': 0,
    },
    {
      'title': 'كم عدد القارات في العالم؟',
      'listChoices': ["5", "6", "7", "8"],
      'correctAnswer': 2,
    },
    {
      'title': 'من هو النبي الذي ابتلعه الحوت؟',
      'listChoices': ["موسى", "يونس", "إبراهيم", "نوح"],
      'correctAnswer': 1,
    },
    {
      'title': 'في أي دولة تقع مدينة البندقية؟',
      'listChoices': ["فرنسا", "إسبانيا", "إيطاليا", "البرتغال"],
      'correctAnswer': 2,
    },
    {
      'title': 'ما هي العملة الرسمية في اليابان؟',
      'listChoices': ["اليوان", "الين", "الريال", "الدولار"],
      'correctAnswer': 1,
    },
  ],
};
