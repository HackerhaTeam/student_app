

import 'package:student_hackerha/core/api/keys/courses/session_keys.dart';
import 'package:student_hackerha/features/courses/domain/Entity/session.dart';

class SessionModel extends Session {
  const SessionModel({
    required super.id,
    required super.courseId,
    required super.video,
    required super.name,
    required super.likes,
    required super.disLikes,
    required super.duration,
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
      duration: json[SessionKeys.duration] as String,
      files: List<String>.from(json[SessionKeys.files] ?? []),
      createdAt: DateTime.parse(json[SessionKeys.createdAt] as String),
      updatedAt: DateTime.parse(json[SessionKeys.updatedAt] as String),
    );
  }


}
