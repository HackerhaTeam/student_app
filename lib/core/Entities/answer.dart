import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/question.dart';

class Answer extends Equatable {
  final int id;
  final String content;
  final bool isCorrect;
  final Question question;

  const Answer({
    required this.id,
    required this.content,
    required this.isCorrect,
    required this.question,
  });

  @override
  List<Object?> get props => [id, content, isCorrect, question];
}
