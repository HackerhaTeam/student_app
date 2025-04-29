import 'package:get_it/get_it.dart';
import 'package:student_hackerha/core/Entities/course.dart';
import 'package:student_hackerha/core/Entities/student.dart';
import 'package:student_hackerha/core/Entities/subject.dart';
import 'package:student_hackerha/core/Entities/teacher.dart';

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
