String getMotivationPhraseTitle({required double percentage}) {
    if (percentage <= 20) {
      return 'لا بأس، كل بداية صعبة';
    } else if (percentage <= 40) {
      return 'أنت على الطريق';
    } else if (percentage <= 60) {
      return 'أداء جيد!';
    } else if (percentage <= 80) {
      return 'عمل رائع!';
    } else if (percentage <= 99) {
      return 'ممتاز جدًا!';
    } else {
      return 'أحسنت!';
    }
  }