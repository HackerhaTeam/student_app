import 'package:equatable/equatable.dart';
import 'package:student_hackerha/features/home/data/models/image_model.dart';
import 'package:student_hackerha/features/home/domain/Entity/image_entity.dart';

class TeacherEntity extends Equatable {
    int id;
    String name;
    dynamic rate;
    ImageModel? image;
    DateTime createdAt;
    int? reviewsCount;
    int? studentsCount;
    int? coursesCount;

    TeacherEntity({
        required this.id,
        required this.name,
        required this.rate,
        required this.image,
        required this.createdAt,
        required this.reviewsCount,
        required this.studentsCount,
        required this.coursesCount,
    });
    
      @override
    
      List<Object?> get props => [id,name,];

   
}