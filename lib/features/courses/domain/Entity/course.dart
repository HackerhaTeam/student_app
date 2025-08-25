import 'package:equatable/equatable.dart';
import 'package:student_hackerha/features/courses/domain/Entity/discount.dart';

class Course extends Equatable {
    final Discount discount;
    final String id;
    final String image;
    final String name;
    final String description;
    final num price;
    final String year;
    final String semester;
    final String note;
    final String type;
    final int rating;
    final String about;
    final String video;
    final bool free;
    final DateTime createdAt;
    final DateTime updatedAt;

    const Course({
        required this.discount,
        required this.id,
        required this.image,
        required this.name,
        required this.description,
        required this.price,
        required this.year,
        required this.semester,
        required this.note,
        required this.type,
        required this.rating,
        required this.about,
        required this.video,
        required this.free,
        required this.createdAt,
        required this.updatedAt,
    });
    
      @override
    
      List<Object?> get props => [id,name];

}
