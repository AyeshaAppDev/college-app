import 'package:flutter/material.dart';
import '../../models/notice.dart';
import '../../services/data_service.dart';

class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  List<Notice> notices = [];
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'Academic', 'Administrative', 'Exam', 'Holiday', 'General'];

  @override
  void initState() {
    super.initState();
    _loadNotices();
  }

  void _loadNotices() {
    setState(() {
      notices = DataService.getNotices();
    });
  }

  List<Notice> get filteredNotices {
    if (selectedCategory == 'All') {
      return notices;
    }
    return notices.where((notice) => notice.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notices'),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
            itemBuilder: (context) => categories
                .map((category) => PopupMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
          ),
        ],
      ),
      body: filteredNotices.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No notices found', style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredNotices.length,
              itemBuilder: (context, index) {
                final notice = filteredNotices[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: _getCategoryColor(notice.category),
                      child: Icon(
                        _getCategoryIcon(notice.category),
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      notice.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          notice.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: _getCategoryColor(notice.category).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                notice.category,
                                style: TextStyle(
                                  color: _getCategoryColor(notice.category),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${notice.date.day}/${notice.date.month}/${notice.date.year}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      _showNoticeDetails(notice);
                    },
                  ),
                );
              },
            ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Academic':
        return Colors.blue;
      case 'Administrative':
        return Colors.orange;
      case 'Exam':
        return Colors.red;
      case 'Holiday':
        return Colors.green;
      case 'General':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Academic':
        return Icons.school;
      case 'Administrative':
        return Icons.admin_panel_settings;
      case 'Exam':
        return Icons.quiz;
      case 'Holiday':
        return Icons.celebration;
      case 'General':
        return Icons.info;
      default:
        return Icons.notifications;
    }
  }

  void _showNoticeDetails(Notice notice) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(notice.title),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                notice.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(notice.category),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      notice.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${notice.date.day}/${notice.date.month}/${notice.date.year}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}