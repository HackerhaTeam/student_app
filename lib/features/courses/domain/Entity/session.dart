import 'package:equatable/equatable.dart';

class Session extends Equatable{
  final String id;
  final String courseId;
  final String video;
  final String name;
  final List<String> likes;
  final List<String> disLikes;
  final String duration;
  final List<String> files;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Session({
    required this.id,
    required this.courseId,
    required this.video,
    required this.name,
    required this.likes,
    required this.disLikes,
    required this.duration,
    required this.files,
    required this.createdAt,
    required this.updatedAt,
  });
  
  @override
  List<Object?> get props => [id,name];
}

