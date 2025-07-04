import 'package:dio/dio.dart';
import 'package:student_hackerha/core/api/keys/api_keys.dart';
import 'package:student_hackerha/features/home/data/models/recently_added_model.dart';


class RecentlyAddedCourseRemoteDataSource {
  final Dio dio;

  RecentlyAddedCourseRemoteDataSource(this.dio);

 
  Future<List<CourseModel>> getRecentlyAddedCourses() async {
    final response = await dio.get(HomeEndpoints.recentlyAdded);
    final data = (response.data['data'] as List)
        .map((item) => CourseModel.fromJson(item))
        .toList();
    return data;
  }
}
