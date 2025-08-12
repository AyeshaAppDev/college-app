class AppNotification {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;
  final String type; // 'event', 'message', 'friend_request'
  final bool isRead;
  final String? relatedId; // ID of related event, message, etc.

  AppNotification({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.type,
    this.isRead = false,
    this.relatedId,
  });

  AppNotification copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? timestamp,
    String? type,
    bool? isRead,
    String? relatedId,
  }) {
    return AppNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
      relatedId: relatedId ?? this.relatedId,
    );
  }
}