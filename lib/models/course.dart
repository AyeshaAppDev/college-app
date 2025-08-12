class Course {
  final String id;
  final String courseCode;
  final String title;
  final String description;
  final String instructor;
  final String schedule;
  final String imageUrl;
  final String fullDescription;
  final int creditHours;
  final int labHours;
  final String department;
  final int semester;
  final String category; // Core, Elective, General Education, etc.

  Course({
    required this.id,
    required this.courseCode,
    required this.title,
    required this.description,
    required this.instructor,
    required this.schedule,
    required this.imageUrl,
    required this.fullDescription,
    required this.creditHours,
    required this.labHours,
    required this.department,
    required this.semester,
    required this.category,
  });

  String get creditDisplay => '$creditHours+$labHours';
  int get totalHours => creditHours + labHours;
}