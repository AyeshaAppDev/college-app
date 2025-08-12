import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceData = [
      {"subject": "Flutter", "status": "Present"},
      {"subject": "Database", "status": "Absent"},
      {"subject": "DSA", "status": "Present"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("My Attendance"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: attendanceData.length,
        itemBuilder: (context, index) {
          final entry = attendanceData[index];
          final isPresent = entry["status"] == "Present";

          return Card(
            color: isPresent ? Colors.green.shade50 : Colors.red.shade50,
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(
                isPresent ? Icons.check_circle : Icons.cancel,
                color: isPresent ? Colors.green : Colors.red,
              ),
              title: Text(
                entry["subject"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                entry["status"]!,
                style: TextStyle(
                  color: isPresent ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
