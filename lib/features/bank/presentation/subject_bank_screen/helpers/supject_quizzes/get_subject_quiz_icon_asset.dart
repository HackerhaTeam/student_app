import 'package:student_hackerha/core/constants/assets_image.dart';

String getSubjectQuizIconAsset({required int index}) {
  if (index > 5) {
    return AppImages.student;
  } else {
    return AppImages.check;
  }
}
