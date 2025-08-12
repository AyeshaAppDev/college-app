class Event {
  final String id;
  final String title;
  final DateTime date;
  final String time;
  final String location;
  final String imageUrl;
  final String description;
  final String category;
  final bool isRegistrationRequired;
  String userStatus; // 'none', 'interested', 'going'

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.description,
    required this.category,
    this.isRegistrationRequired = false,
    this.userStatus = 'none',
  });

  Event copyWith({
    String? id,
    String? title,
    DateTime? date,
    String? time,
    String? location,
    String? imageUrl,
    String? description,
    String? category,
    bool? isRegistrationRequired,
    String? userStatus,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      time: time ?? this.time,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      category: category ?? this.category,
      isRegistrationRequired: isRegistrationRequired ?? this.isRegistrationRequired,
      userStatus: userStatus ?? this.userStatus,
    );
  }
}