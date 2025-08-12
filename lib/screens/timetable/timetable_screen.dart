import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timetable = [
      {"day": "Monday", "subject": "Flutter", "time": "10:00 AM - 12:00 PM"},
      {"day": "Tuesday", "subject": "DSA", "time": "12:00 PM - 2:00 PM"},
      {"day": "Wednesday", "subject": "Database", "time": "9:00 AM - 11:00 AM"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Weekly Timetable"),
      ),
      body: ListView.builder(
        itemCount: timetable.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final entry = timetable[index];
          return Card(
            color: Colors.white,
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.indigo),
              title: Text(
                "${entry['day']}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text("${entry['subject']} • ${entry['time']}"),
            ),
          );
        },
      ),
    );
  }
}
