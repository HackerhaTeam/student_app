import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/DI/%20service_locator.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/core/DI/service_locator.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_cubit.dart';
import 'package:student_hackerha/core/themes/app_theme.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/search_courses/search_courses_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:student_hackerha/features/home/presentation/widgets/navbar/main_navigation.dart';

void main() {
  setupDependencies();
  setupServerLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCoursesCubit(),
        ),
        
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return ThemeProvider(
          duration: Duration(milliseconds: 500),
          initTheme: AppTheme.light,
          builder: (_, myTheme) {
            return MaterialApp(
              locale: const Locale('ar'),
              supportedLocales: const [
                Locale('ar'),
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('ar', ''),
                const Locale('en', ''), 
              ],
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              home: ThemeSwitchingArea(
                child: BlocProvider(
                  create: (context) => SearchCoursesCubit(),
                  child: MainNavigationPage(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}




final Map<String, dynamic> quizData = {
  'quizTime': 900,
  'questionsList': [
    {
      'title': 'ما هو نوع البيانات  f(x) المناسب لتخزين عدد صحيح؟',
      'listChoices': [
        "float",
        "int",
        "char",
        "نوع منطقي يُستخدم لتخزين القيم الصحيحة مثل 0 أو 1."
      ],
      'correctAnswer': 1,
      'note': "int هو النوع المستخدم لتخزين الأعداد الصحيحة بدون فاصلة عشرية."
    },
    {
      'title': 'ما الكلمة المفتاحية المستخدمة لإنشاء دالة في لغة C++؟',
      'listChoices': [
        "function",
        "def",
        "void",
        "fn (غير موجودة في C++ ولكن موجودة بلغات أخرى مثل Rust)"
      ],
      'correctAnswer': 2,
      'note':
          "في C++ تُستخدم الكلمة void أو أي نوع بيانات لتعريف دالة، مثل: void myFunc()."
    },
    {
      'title':
          'ماذا ستكون نتيجة تنفيذ الكود التالي؟\n\nint a = 5;\nint b = 2;\ncout << a / b;',
      'listChoices': [
        "2",
        "2.5",
        "سيظهر خطأ لأن النتيجة ليست عددًا صحيحًا",
        "7"
      ],
      'correctAnswer': 0,
      'note':
          "العملية بين عددين صحيحين في C++ تُنتج عددًا صحيحًا، لذا 5 / 2 = 2."
    },
    {
      'title':
          'ما هو مخرج الكود التالي؟\n\nint x = 10;\nif (x > 5) {\n   cout << \"Yes\";\n} else {\n   cout << \"No\";\n}',
      'listChoices': [
        "No",
        "Yes",
        "خطأ في الكود بسبب الأقواس أو التنسيق",
        "لن يتم طباعة أي شيء لأن الشرط غير صحيح"
      ],
      'correctAnswer': 1,
    },
    {
      'title': 'ما الفرق بين ++i و i++؟',
      'listChoices': [
        "كلاهما لا يغيّر قيمة i",
        "++i تزيد i ثم تُستخدم، أما i++ فتُستخدم ثم تزيد القيمة بعد ذلك.",
        "i++ تزيد i مرتين في بعض الأحيان.",
        "لا فرق بينهما، مجرد أسلوبين لنفس الشيء."
      ],
      'correctAnswer': 1,
      'note':
          "++i تُزيد القيمة قبل استخدامها، بينما i++ تُستخدم أولًا ثم يتم الزيادة."
    },
    {
      'title': 'ما هي الطريقة الصحيحة لتعريف مصفوفة من 5 عناصر صحيحة؟',
      'listChoices': [
        "int arr[5];",
        "array<int> arr(5);  // هذه الطريقة تُستخدم في C++ STL",
        "vector<int> arr[5];",
        "int arr = {5}; // تعريف غير صحيح"
      ],
      'correctAnswer': 0,
    },
    {
      'title': '''اقرأ الكود التالي بعناية ثم أجب:
    
#include <iostream>
using namespace std;

int main() {
    int total = 0;
    for (int i = 1; i <= 5; i++) {
        for (int j = 1; j <= i; j++) {
            total += j;
        }
    }
    cout << "Total: " << total << endl;
    return 0;
}

ما هو ناتج طباعة هذا البرنامج بعد تنفيذ الحلقات المتداخلة؟''',
      'listChoices': ["Total: 15", "Total: 35", "Total: 55", "Total: 20"],
      'correctAnswer': 1,
      'note':
          "المجموع الناتج عن جمع الأرقام الداخلية من 1 إلى i هو: 1+1+2+1+2+3+... حتى 5، والناتج النهائي هو 35."
    },
    {
      'title':
          'ما هو مخرج الكود التالي؟\n\nfor (int i = 0; i < 3; i++) {\n   cout << i << \" \";\n}',
      'listChoices': [
        "0 1 2",
        "1 2 3",
        "0 1 2 3",
        "خطأ في تنفيذ الحلقة بسبب حدود الشرط"
      ],
      'correctAnswer': 0
    },
    {
      'title':
          'ما هو ناتج الكود التالي؟\n\nint x = 3;\nint y = 4;\nswap(x, y);\ncout << x << \" \" << y;',
      'listChoices': ["3 4", "4 3", "سيظهر خطأ لأن swap غير معرفة", "0 0"],
      'correctAnswer': 1,
      'note': "swap تقوم بتبديل القيمتين، لذا x يصبح 4 و y يصبح 3."
    },
    {
      'title': '''أي من التالي ليس نوعًا بدائيًا في لغة 
      c++؟''',
      'listChoices': [
        "int",
        "bool",
        "float",
        "string - لأنها كائن (object) من مكتبة STL"
      ],
      'correctAnswer': 3,
      'note': "string ليست نوعًا بدائيًا في C++، بل تُعتبر كائنًا من مكتبة std."
    },
    {
      'title': 'ماذا تمثل الكلمة المفتاحية const؟',
      'listChoices': [
        "تعني أن المتغير محلي فقط ولا يُستخدم خارج النطاق.",
        "تعني أن المتغير لا يمكن تغييره بعد تعيينه، مما يجعله ثابتًا.",
        "تعني أن المتغير عام ويمكن الوصول له من أي مكان.",
        "تعني حذف المتغير من الذاكرة."
      ],
      'correctAnswer': 1,
      'note': "const تمنع تعديل قيمة المتغير بعد تعيينها."
    },
  ]
};