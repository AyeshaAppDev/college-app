class UserProfile {
  final String fullName;
  final String email;
  final String studentId;
  final String enrolledCourse;
  final String profileImageUrl;
  final String department;
  final String semester;
  final String phoneNumber;
  final String bio;
  final String batch;
  final int friendsCount;
  final int eventsAttended;
  final int postsMade;

  UserProfile({
    required this.fullName,
    required this.email,
    required this.studentId,
    required this.enrolledCourse,
    required this.profileImageUrl,
    required this.department,
    required this.semester,
    required this.phoneNumber,
    this.bio = '',
    this.batch = '',
    this.friendsCount = 0,
    this.eventsAttended = 0,
    this.postsMade = 0,
  });

  UserProfile copyWith({
    String? fullName,
    String? email,
    String? studentId,
    String? enrolledCourse,
    String? profileImageUrl,
    String? department,
    String? semester,
    String? phoneNumber,
    String? bio,
    String? batch,
    int? friendsCount,
    int? eventsAttended,
    int? postsMade,
  }) {
    return UserProfile(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      studentId: studentId ?? this.studentId,
      enrolledCourse: enrolledCourse ?? this.enrolledCourse,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      department: department ?? this.department,
      semester: semester ?? this.semester,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.bio,
      batch: batch ?? this.batch,
      friendsCount: friendsCount ?? this.friendsCount,
      eventsAttended: eventsAttended ?? this.eventsAttended,
      postsMade: postsMade ?? this.postsMade,
    );
  }
}