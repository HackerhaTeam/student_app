String getMotivationPhraseDescription({required double percentage}) {
  if (percentage <= 20) {
    return 'لم يكن هذا أفضل أدائك، لكن لا تيأس! تعلّم من أخطائك وسترى التحسن بسرعة';
  } else if (percentage <= 40) {
    return 'بدأت البداية، وهذا هو الأهم! استمر بالمحاولة، الخطوة القادمة ستكون أفضل';
  } else if (percentage <= 60) {
    return 'قطعت نصف الطريق، والقادم أفضل! تابع التدريب، فأنت تقترب من التميز';
  } else if (percentage <= 80) {
    return 'أداؤك يُظهر فهمًا جيدًا، استمر بهذا المستوى وادفع بنفسك إلى القمة';
  } else if (percentage <= 99) {
    return 'نتيجتك مبهرة، يبدو أنك بذلت جهدًا واضحًا واصل هكذا';
  } else {
    return 'أداؤك رائع! استمر الآن وواصل التقدم نحو مستويات أعلى دائمًا';
  }
}