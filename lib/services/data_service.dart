import '../models/course.dart';
import '../models/event.dart';
import '../models/notice.dart';
import '../models/user_profile.dart';
import '../models/notification.dart';

class DataService {
  // Singleton pattern
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  // Software Engineering Courses Data
  static List<Course> getCourses() {
    return [
      // Semester 1
      Course(
        id: '1',
        courseCode: 'CL1000',
        title: 'Introduction to Information and Communication Technology',
        description: 'Basic concepts of ICT and computer literacy',
        instructor: 'Dr. Sarah Ahmed',
        schedule: 'Mon, Wed 9:00-10:00 AM',
        imageUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        fullDescription: 'This course introduces students to fundamental concepts of Information and Communication Technology, covering basic computer operations, internet usage, and digital literacy skills essential for academic and professional success.',
        creditHours: 0,
        labHours: 1,
        department: 'Computer Science',
        semester: 1,
        category: 'Computing Core',
      ),
      Course(
        id: '2',
        courseCode: 'CS1002',
        title: 'Programming Fundamentals',
        description: 'Introduction to programming concepts and C++ language',
        instructor: 'Prof. Muhammad Ali',
        schedule: 'Tue, Thu 10:00-11:30 AM',
        imageUrl: 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        fullDescription: 'Fundamental programming concepts including variables, data types, control structures, functions, and arrays using C++ programming language. Includes hands-on programming exercises and projects.',
        creditHours: 3,
        labHours: 1,
        department: 'Computer Science',
        semester: 1,
        category: 'Computing Core',
      ),
      // Add all your other courses here...
      
      // Semester 6 courses (add these)
      Course(
        id: '3',
        courseCode: 'SE6001',
        title: 'Software Engineering Project',
        description: 'Final year capstone project',
        instructor: 'Dr. Ahmed Khan',
        schedule: 'Mon, Wed, Fri 2:00-4:00 PM',
        imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        fullDescription: 'Comprehensive software development project applying all learned concepts.',
        creditHours: 6,
        labHours: 0,
        department: 'Software Engineering',
        semester: 6,
        category: 'Core',
      ),
      // Add more semester 6 courses...
    ];
  }

  // Get courses by semester
  static List<Course> getCoursesBySemester(int semester) {
    return getCourses().where((course) => course.semester == semester).toList();
  }

  // Get current semester courses (example: semester 6)
  static List<Course> getCurrentSemesterCourses() {
    return getCoursesBySemester(6); // Current semester
  }

  // Get courses by category
  static List<Course> getCoursesByCategory(String category) {
    return getCourses().where((course) => course.category == category).toList();
  }

  static List<Event> getEvents() {
    return [
      Event(
        id: '1',
        title: 'Software Engineering Symposium 2024',
        date: DateTime.now().add(const Duration(days: 15)),
        time: '10:00 AM',
        location: 'Main Auditorium',
        imageUrl: 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        description: 'Annual symposium featuring industry experts discussing latest trends in software engineering.',
        category: 'Academic',
        isRegistrationRequired: true,
      ),
      Event(
        id: '2',
        title: 'Hackathon 2024',
        date: DateTime.now().add(const Duration(days: 30)),
        time: '9:00 AM',
        location: 'Computer Lab Complex',
        imageUrl: 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        description: '48-hour coding competition for students to showcase their programming skills.',
        category: 'Competition',
        isRegistrationRequired: true,
      ),
      Event(
        id: '3',
        title: 'Career Fair',
        date: DateTime.now().add(const Duration(days: 45)),
        time: '11:00 AM',
        location: 'Sports Complex',
        imageUrl: 'https://images.unsplash.com/photo-1559136555-9303baea8ebd?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        description: 'Meet with top tech companies and explore internship and job opportunities.',
        category: 'Career',
        isRegistrationRequired: false,
      ),
      Event(
        id: '4',
        title: 'Freshers\' Welcome Party',
        date: DateTime.now().add(const Duration(days: 7)),
        time: '6:00 PM',
        location: 'Student Center Hall',
        imageUrl: 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        description: 'Welcome celebration for new students with entertainment, food, and networking opportunities.',
        category: 'Social',
        isRegistrationRequired: true,
      ),
      Event(
        id: '5',
        title: 'Tech Fest',
        date: DateTime.now().add(const Duration(days: 60)),
        time: '9:00 AM',
        location: 'Engineering Block',
        imageUrl: 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        description: 'Annual technology festival featuring project exhibitions, tech talks, and innovation showcases.',
        category: 'Academic',
        isRegistrationRequired: false,
      ),
      Event(
        id: '6',
        title: 'Sports Day',
        date: DateTime.now().add(const Duration(days: 90)),
        time: '8:00 AM',
        location: 'Sports Ground',
        imageUrl: 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        description: 'Inter-departmental sports competition including cricket, football, basketball, and athletics.',
        category: 'Sports',
        isRegistrationRequired: true,
      ),
      Event(
        id: '7',
        title: 'Cultural Night',
        date: DateTime.now().add(const Duration(days: 120)),
        time: '7:00 PM',
        location: 'Open Air Theater',
        imageUrl: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        description: 'Multicultural evening featuring music, dance, drama performances, and traditional food stalls.',
        category: 'Cultural',
        isRegistrationRequired: false,
      ),
      Event(
        id: '8',
        title: 'Graduation Ceremony',
        date: DateTime.now().add(const Duration(days: 180)),
        time: '10:00 AM',
        location: 'Main Auditorium',
        imageUrl: 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        description: 'Annual graduation ceremony celebrating the achievements of graduating students.',
        category: 'Academic',
        isRegistrationRequired: false,
      ),
    ];
  }

  static List<AppNotification> getNotifications() {
    return [
      AppNotification(
        id: '1',
        title: 'New Event: Tech Fest 2024',
        description: 'A new tech festival has been announced. Check it out!',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: 'event',
        relatedId: '2',
      ),
      AppNotification(
        id: '2',
        title: 'Friend Request',
        description: 'Sarah Ahmed sent you a friend request',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        type: 'friend_request',
      ),
      AppNotification(
        id: '3',
        title: 'Event Reminder',
        description: 'Freshers\' Welcome Party is tomorrow!',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: 'event',
        relatedId: '1',
        isRead: true,
      ),
    ];
  }

  static UserProfile getUserProfile() {
    return UserProfile(
      fullName: 'Ahmad Hassan',
      email: 'ahmad.hassan@student.edu.pk',
      studentId: 'SE2021-001',
      enrolledCourse: 'Software Engineering',
      profileImageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&q=80',
      department: 'Software Engineering',
      semester: '6th Semester',
      phoneNumber: '+92-300-1234567',
      bio: 'Passionate software engineering student with interests in mobile app development and AI. Always eager to learn new technologies and work on innovative projects.',
      batch: '2021-2025',
      friendsCount: 127,
      eventsAttended: 15,
      postsMade: 23,
    );
  }

  static List<Notice> getNotices() {
    return [
      Notice(
        id: '1',
        title: 'Mid-Term Examination Schedule',
        description: 'Mid-term examinations will be conducted from March 15-25, 2024. Please check your individual timetables for specific dates and venues.',
        date: DateTime.now().subtract(const Duration(days: 2)),
        category: 'Exam',
        isImportant: true,
      ),
      Notice(
        id: '2',
        title: 'Library Hours Extended',
        description: 'Library hours have been extended during examination period. New timings: 7:00 AM - 11:00 PM on weekdays.',
        date: DateTime.now().subtract(const Duration(days: 5)),
        category: 'Academic',
        isImportant: false,
      ),
      Notice(
        id: '3',
        title: 'Fee Payment Deadline',
        description: 'Semester fee payment deadline is March 31, 2024. Late fee charges will apply after the deadline.',
        date: DateTime.now().subtract(const Duration(days: 7)),
        category: 'Administrative',
        isImportant: true,
      ),
      Notice(
        id: '4',
        title: 'Spring Break Holiday',
        description: 'Spring break holidays from April 1-7, 2024. Classes will resume on April 8, 2024.',
        date: DateTime.now().subtract(const Duration(days: 10)),
        category: 'Holiday',
        isImportant: false,
      ),
      Notice(
        id: '5',
        title: 'Career Fair 2024',
        description: 'Annual career fair will be held on April 15, 2024. Top companies will be participating for recruitment.',
        date: DateTime.now().subtract(const Duration(days: 12)),
        category: 'General',
        isImportant: false,
      ),
    ];
  }
}
