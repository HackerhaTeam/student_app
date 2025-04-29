import 'package:get_it/get_it.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/Entities/student.dart';
import 'package:student_hackerha/core/Entities/subject.dart';
import 'package:student_hackerha/core/Entities/teacher.dart';

final locator = GetIt.instance;

void setupDependencies() {
  // 1. تهيئة المواد (Subjects)
  final mathSubject = Subject(
    id: 1,
    name: 'الرياضيات',
    description: 'مادة الرياضيات الأساسية',
    year: 1,
    semester: 1,
    universityId: 1,
  );

  final programmingSubject = Subject(
    id: 2,
    name: 'البرمجة',
    description: 'مبادئ البرمجة وهياكل البيانات',
    year: 1,
    semester: 2,
    universityId: 1,
  );

  // 2. تهيئة المدرسين
  final teacher1 = Teacher(
    id: 1,
    email: 'teacher1@university.edu',
    firstName: 'أحمد',
    lastName: 'علي',
    phone: '0991234567',
    description: 'أستاذ في كلية الهندسة المعلوماتية',
  );

  // 3. تهيئة الكورسات
  final programmingCourse = Course(
    id: 1,
    name: 'البرمجة (1)',
    summary: 'مقدمة في البرمجة وهياكل البيانات الأساسية',
    description: 'هذه الدورة موجهة لطلاب كلية الهندسة المعلوماتية',
    duration: 45, // ساعات
    likes: 120,
    dislikes: 5,
    endDate: DateTime(2024, 6, 30),
    year: 2023,
    section: "A",
    subject: programmingSubject,
    teacher: teacher1,
  );

  final mathCourse = Course(
    id: 2,
    name: 'الرياضيات (1)',
    summary: 'الجبر الخطي وحساب المثلثات',
    description: 'مقدمة في الرياضيات الجامعية',
    duration: 60,
    likes: 95,
    dislikes: 3,
    endDate: DateTime(2024, 6, 30),
    year: 2023,
    section: "B",
    subject: mathSubject,
    teacher: teacher1,
  );

  // 4. تهيئة الطلاب
  final student1 = Student(
    id: 1,
    email: 'student1@university.edu',
    firstName: 'محمد',
    lastName: 'خالد',
    phone: 0999876543,
    studentNumber: '2023001',
    enrolledCourses: [programmingCourse, mathCourse],
  );

  List<Course> courses = [programmingCourse, mathCourse];
  // 5. التسجيل في GetIt
  // الكورسات - Singleton لأنها لا تتغير

  locator.registerSingleton<List<Course>>(courses, instanceName: 'courses');

  locator.registerSingleton<Course>(mathCourse, instanceName: 'math_course');

  // المواد - Singleton
  locator.registerSingleton<Subject>(mathSubject, instanceName: 'math_subject');
  locator.registerSingleton<Subject>(programmingSubject,
      instanceName: 'programming_subject');

  // المدرسون - Singleton
  locator.registerSingleton<Teacher>(teacher1, instanceName: 'teacher_1');

  // الطلاب - Factory لأنها قد تتغير (تسجيل دخول/خروج)
  locator.registerFactoryParam<Student, void, void>((_, __) => student1);

  // قائمة الكورسات - Factory لأنها قد تتحدّث
  locator.registerFactory<List<Course>>(() => [programmingCourse, mathCourse]);
}
