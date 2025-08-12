import 'package:flutter/material.dart';
import '../models/notification.dart';
import '../services/data_service.dart';

class NotificationProvider extends ChangeNotifier {
  List<AppNotification> _notifications = [];
  int _unreadCount = 0;

  List<AppNotification> get notifications => _notifications;
  int get unreadCount => _unreadCount;

  NotificationProvider() {
    loadNotifications();
  }

  void loadNotifications() {
    _notifications = DataService.getNotifications();
    _updateUnreadCount();
    notifyListeners();
  }

  void markAsRead(String notificationId) {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
      _updateUnreadCount();
      notifyListeners();
    }
  }

  void markAllAsRead() {
    _notifications = _notifications.map((n) => n.copyWith(isRead: true)).toList();
    _updateUnreadCount();
    notifyListeners();
  }

  void addNotification(AppNotification notification) {
    _notifications.insert(0, notification);
    _updateUnreadCount();
    notifyListeners();
  }

  void _updateUnreadCount() {
    _unreadCount = _notifications.where((n) => !n.isRead).length;
  }
}