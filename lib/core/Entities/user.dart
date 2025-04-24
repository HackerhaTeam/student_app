import 'package:equatable/equatable.dart';

// ==================== الكيانات الأساسية ====================
class User extends Equatable {
  final int id;
  final String? email;

  const User({required this.id, this.email});

  @override
  List<Object?> get props => [id, email];
}
