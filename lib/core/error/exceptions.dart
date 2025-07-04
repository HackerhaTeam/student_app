import 'package:dio/dio.dart';
import 'package:student_hackerha/core/error/err_model.dart';

abstract class Failure{
  final String? message;

  Failure(this.message);

}
class ServerFailure extends Failure implements Exception {
  ServerFailure(super.message);
  
  
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerFailure(e.message);
    case DioExceptionType.sendTimeout:
       throw ServerFailure(e.message);
    case DioExceptionType.receiveTimeout:
       throw ServerFailure(e.message);
    case DioExceptionType.badCertificate:
       throw ServerFailure(e.message);
    case DioExceptionType.cancel:
       throw ServerFailure(e.message);
    case DioExceptionType.connectionError:
       throw ServerFailure(e.message);
    case DioExceptionType.unknown:
       throw ServerFailure(e.message);
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerFailure(
             e.message);
        case 401: //unauthorized
         throw ServerFailure(
             e.message);
        case 403: //forbidden
        throw ServerFailure(
             e.message);
        case 404: //not found
          throw ServerFailure(
             e.message);
        case 409: //cofficient
        throw ServerFailure(
             e.message);
        case 422: //  Unprocessable Entity
         throw ServerFailure(
             e.message);
        case 504: // Server exception
         throw ServerFailure(
             e.message);
      }
  }
}