import 'package:dio/dio.dart';
import 'package:student_hackerha/core/api/keys/api_keys.dart';
import 'package:student_hackerha/features/home/data/models/teachers_model.dart';
import 'package:student_hackerha/features/home/domain/Entity/teacher_entity.dart';

class TopTeacherDataSourse {
  final Dio dio ;

  TopTeacherDataSourse(this.dio); 
  Future <List<TeacherEntity>> getTopTeacher()async{
    final response = await dio.get("HomeEndpoints.topTeachers");
    final data = (response.data['data'] as List).map((item)=>TeachersModel.fromJson(item)).toList();
    return data;
  }
  
}