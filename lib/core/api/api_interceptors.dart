import 'package:dio/dio.dart';
import 'package:student_hackerha/core/api/keys/api_keys.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = "Bearer 11|9DCXlKlTv8wbOVCIKcI1EQA5CSW11RJ5OapCHtdla3fb7e72";
    options.baseUrl=BaseUrl.baseUrl;
    super.onRequest(options, handler);
  }
}