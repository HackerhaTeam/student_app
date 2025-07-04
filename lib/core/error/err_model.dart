import 'package:student_hackerha/core/api/keys/api_keys.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[''],
      errorMessage: jsonData['ApiKey.errorMessage'],
    );
  }
}