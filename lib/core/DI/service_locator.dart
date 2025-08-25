import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/Entities/student.dart';
import 'package:student_hackerha/core/Entities/subject.dart';
import 'package:student_hackerha/core/Entities/teacher.dart';
import 'package:student_hackerha/core/api/dio_consumer.dart';
import 'package:student_hackerha/core/api/keys/api_keys.dart';
import 'package:student_hackerha/features/courses/data/remote/course_remote_data_source.dart';
import 'package:student_hackerha/features/courses/data/repositories/course_repo_impl.dart';
import 'package:student_hackerha/features/courses/domain/repositories/CourseRepo.dart';
import 'package:student_hackerha/features/courses/domain/usecase/courses_usecase.dart';
import 'package:student_hackerha/features/courses/presentation/manager/cubit/GetCourses/get_courses_cubit.dart';
import 'package:student_hackerha/features/home/data/repositories/my_coureses_repo_impl.dart';
import 'package:student_hackerha/features/home/data/repositories/recently_added_course_repo_impl.dart';
import 'package:student_hackerha/features/home/data/repositories/top_teacher_repsioties_impl.dart';
import 'package:student_hackerha/features/home/data/source/my_courses_data_source.dart';
import 'package:student_hackerha/features/home/data/source/recently_added_course_data_source.dart';
import 'package:student_hackerha/features/home/data/source/top_teacher_data_sourse.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';
import 'package:student_hackerha/features/home/domain/repositories/my_course_repo.dart';
import 'package:student_hackerha/features/home/domain/repositories/recently_added_course_repositories.dart';
import 'package:student_hackerha/features/home/domain/repositories/top_teacher_repo.dart';
import 'package:student_hackerha/features/home/domain/usecase/my_courses_usecase.dart';
import 'package:student_hackerha/features/home/domain/usecase/recently_added_course_usecase.dart';
import 'package:student_hackerha/features/home/domain/usecase/top_teacher_usecase.dart';
import 'package:student_hackerha/features/home/presentation/manager/my%20courses%20cubit/my_courses_cubit.dart';
import 'package:student_hackerha/features/home/presentation/manager/recentlyAddedCourseCubit/recently_added_course_cubit.dart';
import 'package:student_hackerha/features/home/presentation/manager/top%20teacher/top_teacher_cubit.dart';

final locator = GetIt.instance;
void setupDependencies() {
  // 1. تهيئة المواد (Subjects)
  final subjects = [
    Subject(
      id: 1,
      name: 'الرياضيات',
      description: 'مادة الرياضيات الأساسية',
      year: 1,
      semester: 1,
      universityId: 1,
    ),
    Subject(
      id: 2,
      name: 'البرمجة',
      description: 'مبادئ البرمجة وهياكل البيانات',
      year: 1,
      semester: 2,
      universityId: 1,
    ),
    Subject(
      id: 3,
      name: 'الفيزياء',
      description: 'مبادئ الفيزياء الجامعية',
      year: 1,
      semester: 1,
      universityId: 1,
    ),
    Subject(
      id: 4,
      name: 'الإحصاء',
      description: 'مبادئ الإحصاء للمهندسين',
      year: 1,
      semester: 2,
      universityId: 1,
    ),
    Subject(
      id: 5,
      name: 'هياكل بيانات',
      description: 'مادة متقدمة في البرمجة وهياكل البيانات',
      year: 1,
      semester: 2,
      universityId: 1,
    ),
  ];

  // 2. تهيئة المدرسين
  final teacher1 = Teacher(
    id: 1,
    email: 'teacher1@university.edu',
    firstName: 'أحمد',
    lastName: 'علي',
    phone: '0991234567',
    description: 'أستاذ في كلية الهندسة المعلوماتية',
  );

  final teacher2 = Teacher(
    id: 2,
    email: 'teacher2@university.edu',
    firstName: 'ليلى',
    lastName: 'حسن',
    phone: '0997654321',
    description: 'أستاذة في قسم الرياضيات',
  );

  // 3. تهيئة الكورسات (أكتر من كورس)
  final courses = [
    Course(
      id: 1,
      name: 'الرياضيات (1)',
      summary: 'مقدمة في الجبر وحساب المثلثات',
      description: 'أساسيات الرياضيات للسنة الأولى',
      duration: 60,
      likes: 100,
      dislikes: 2,
      endDate: DateTime(2024, 6, 30),
      year: 1,
      section: "A",
      subject: subjects[0], // رياضيات
      teacher: teacher2,
    ),
    Course(
      id: 2,
      name: 'البرمجة (1)',
      summary: 'مقدمة في البرمجة بلغة C++',
      description: 'تعلم البرمجة من الصفر',
      duration: 45,
      likes: 120,
      dislikes: 5,
      endDate: DateTime(2024, 6, 30),
      year: 2,
      section: "A",
      subject: subjects[1], // برمجة
      teacher: teacher1,
    ),
    Course(
      id: 3,
      name: 'فيزياء عامة (1)',
      summary: 'مبادئ الحركة والميكانيكا',
      description: 'فيزياء كلاسيكية أساسية',
      duration: 50,
      likes: 90,
      dislikes: 3,
      endDate: DateTime(2024, 6, 30),
      year: 1,
      section: "B",
      subject: subjects[2], // فيزياء
      teacher: teacher2,
    ),
    Course(
      id: 4,
      name: 'مبادئ الإحصاء',
      summary: 'مفاهيم إحصائية لطلاب الهندسة',
      description: 'احتمالات وتوزيعات إحصائية',
      duration: 40,
      likes: 75,
      dislikes: 4,
      endDate: DateTime(2024, 6, 30),
      year: 2,
      section: "B",
      subject: subjects[3], // إحصاء
      teacher: teacher1,
    ),
    Course(
      id: 5,
      name: 'هياكل بيانات (1)',
      summary: 'مقدمة في هياكل البيانات',
      description: 'قوائم، مكدسات، طوابير، أشجار',
      duration: 55,
      likes: 85,
      dislikes: 2,
      endDate: DateTime(2024, 6, 30),
      year: 2,
      section: "A",
      subject: subjects[4], // هياكل بيانات
      teacher: teacher1,
    ),
  ];

  // 4. تهيئة طالب تجريبي
  final student1 = Student(
    id: 1,
    email: 'student1@university.edu',
    firstName: 'محمد',
    lastName: 'خالد',
    phone: 0999876543,
    studentNumber: '2023001',
    enrolledCourses: courses,
  );

  // 5. التسجيل في GetIt
  locator.registerSingleton<List<Course>>(courses, instanceName: 'courses');

  for (var i = 0; i < subjects.length; i++) {
    locator.registerSingleton<Subject>(subjects[i],
        instanceName: 'subject_${i + 1}');
  }

  locator.registerSingleton<Teacher>(teacher1, instanceName: 'teacher_1');
  locator.registerSingleton<Teacher>(teacher2, instanceName: 'teacher_2');

  locator.registerFactoryParam<Student, void, void>((_, __) => student1);

  locator.registerFactory<List<Course>>(() => courses);
}

final sl = GetIt.instance;

void init() {
  // Dio
   sl.registerLazySingleton<DioConsumer>((){
  DioConsumer dioConsumer=  DioConsumer(dio: Dio()); 
  return dioConsumer;},);

  // Data Source
  sl.registerLazySingleton<CourseRemoteDataSource>(
    () => CourseRemoteDataSource( dioConsumer:sl()),
  );


  // Repository
  sl.registerLazySingleton<CourseRepo>(
    () => CourseRepoImpl(courseRemoteDataSource: sl()),
    
  );
 
  sl.registerLazySingleton<GetCoursesUsecase>(
    () => GetCoursesUsecase(courseRepo:sl()),
  );

  // Use Case

  // Cubit
  
  sl.registerFactory(() => GetCoursesCubit(sl()));


  sl.registerLazySingleton<Dio>((){Dio dio = Dio();
 
  return dio;},);

  // Data Source
  sl.registerLazySingleton<RecentlyAddedCourseRemoteDataSource>(
    () => RecentlyAddedCourseRemoteDataSource(sl()),
  );
sl.registerLazySingleton<MyCoursesDataSource>(
    () => MyCoursesDataSource(sl()),
  );

  // Repository
  sl.registerLazySingleton<RecentlyAddedCourseRepository>(
    () => RecentlyAddedCourseRepositoryImpl(sl()),
    
  );
  sl.registerLazySingleton<MyCourseRepo>(
    () =>MyCouresesRepoImpl (sl()),
    
  );
  sl.registerLazySingleton<MyCoursesUsecase>(
    () => MyCoursesUsecase(sl()),
  );

  // Use Case
  sl.registerLazySingleton(() => GetRecentlyAddedCoursesUseCase(sl()));

  // Cubit
  sl.registerFactory(() => RecentlyAddedCoursesCubit(sl()));
  sl.registerFactory(() => MyCoursesCubit(sl()));






   sl.registerLazySingleton<TopTeacherDataSourse>(
    () => TopTeacherDataSourse(sl()),
  );

  // Repository
  sl.registerLazySingleton<TopTeacherRepositories>(
    () => TopTeacherRepsiotiesImpl(sl()),
  );

  // Use Case
  sl.registerLazySingleton(() => TopTeacherUsecase(sl()));

  // Cubit
  sl.registerFactory(() => TopTeacherCubit(sl()));
  
}
