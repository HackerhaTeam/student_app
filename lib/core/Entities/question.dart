import 'package:equatable/equatable.dart';
import 'package:student_hackerha/core/Entities/answer.dart';
import 'package:student_hackerha/core/Entities/quiz.dart';

class Question extends Equatable {
  final int id;
  final String content;
  final int type;
  final int order;
  final Quiz quiz;
  final List<Answer> answers;

  const Question({
    required this.id,
    required this.content,
    required this.type,
    required this.order,
    required this.quiz,
    required this.answers,
  });

  @override
  List<Object?> get props => [id, content, type, order, quiz, answers];
}
