
import 'package:student_hackerha/features/courses/domain/Entity/session.dart';

extension SessionListX on List<Session> {
  int get totalDuration {
    return fold(0, (sum, session) {
      final parts = session.duration.split(":");
      if (parts.length >= 2) {
        final minutes = int.tryParse(parts[0]) ?? 0;
        return sum + minutes;
      }
      return sum;
    });
  }

  int get totalFiles {
    return fold(0, (sum, session) => sum + session.files.length);
  }

  String get totalDurationFormatted {
    final total = totalDuration;
    final hours = total ~/ 60;
    final minutes = total % 60;

    if (hours == 0) {
      return "$minutes د";
    } else if (minutes == 0) {
      return "$hours س";
    } else {
      return "$hours س و $minutes د";
    }
  }
}