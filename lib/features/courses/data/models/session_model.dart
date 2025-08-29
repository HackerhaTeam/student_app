

import 'package:student_hackerha/core/api/keys/Enroll-Course/session_keys.dart';
import 'package:student_hackerha/features/courses/domain/Entity/session.dart';

class SessionModel extends Session {
  const SessionModel({
    required super.id,
    required super.courseId,
    required super.video,
    required super.name,
    required super.likes,
    required super.disLikes,
    required super.durationByMin,
    required super.files,
    required super.createdAt,
    required super.updatedAt,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      id: json[SessionKeys.id] as String,
      courseId: json[SessionKeys.courseId] as String,
      video: json[SessionKeys.video] as String,
      name: json[SessionKeys.name] as String,
      likes: List<String>.from(json[SessionKeys.likes] ?? []),
      disLikes: List<String>.from(json[SessionKeys.disLikes] ?? []),
      durationByMin: json[SessionKeys.durationByMin] as int,
      files: List<String>.from(json[SessionKeys.files] ?? []),
      createdAt: DateTime.parse(json[SessionKeys.createdAt] as String),
      updatedAt: DateTime.parse(json[SessionKeys.updatedAt] as String),
    );
  }


}
