import 'package:equatable/equatable.dart';
import 'package:student_hackerha/features/courses/domain/Entity/discount.dart';
import 'package:student_hackerha/features/courses/domain/Entity/session.dart';

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
  final List<Session> sessions; // غيرنا الاسم session → sessions و خليها non-nullable مع default []

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
    this.sessions = const [],
  });

  // copyWith لتحديث أي حقل، خصوصًا الـ sessions
  Course copyWith({
    Discount? discount,
    String? id,
    String? image,
    String? name,
    String? description,
    num? price,
    String? year,
    String? semester,
    String? note,
    String? type,
    int? rating,
    String? about,
    String? video,
    bool? free,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Session>? sessions,
  }) {
    return Course(
      discount: discount ?? this.discount,
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      year: year ?? this.year,
      semester: semester ?? this.semester,
      note: note ?? this.note,
      type: type ?? this.type,
      rating: rating ?? this.rating,
      about: about ?? this.about,
      video: video ?? this.video,
      free: free ?? this.free,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sessions: sessions ?? this.sessions,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        description,
        price,
        year,
        semester,
        note,
        type,
        rating,
        about,
        video,
        free,
        createdAt,
        updatedAt,
        discount,
        sessions,
      ];
}
