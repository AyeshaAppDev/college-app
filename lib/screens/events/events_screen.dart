import 'package:flutter/material.dart';
import '../../models/event.dart';
import '../../services/data_service.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<Event> events = [];
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'Academic', 'Cultural', 'Sports', 'Technical', 'Workshop'];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  void _loadEvents() {
    setState(() {
      events = DataService.getEvents();
    });
  }

  List<Event> get filteredEvents {
    if (selectedCategory == 'All') {
      return events;
    }
    return events.where((event) => event.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Events'),
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
      body: filteredEvents.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No events found', style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: event.imageUrl.isNotEmpty
                              ? Image.network(
                                  event.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.event, size: 64, color: Colors.grey);
                                  },
                                )
                              : const Icon(Icons.event, size: 64, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    event.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _getCategoryColor(event.category),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    event.category,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text(
                                  '${event.date.day}/${event.date.month}/${event.date.year}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(width: 16),
                                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text(
                                  event.time,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    event.location,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              event.description,
                              style: const TextStyle(fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            if (event.isRegistrationRequired)
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showRegistrationDialog(event);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1565C0),
                                    foregroundColor: Colors.white,
                                  ),
                                  child: Text(
                                    event.userStatus == 'registered' ? 'Registered' : 'Register Now',
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
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
      case 'Cultural':
        return Colors.purple;
      case 'Sports':
        return Colors.green;
      case 'Technical':
        return Colors.orange;
      case 'Workshop':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showRegistrationDialog(Event event) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Register for ${event.title}'),
        content: const Text('Are you sure you want to register for this event?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Successfully registered for the event!')),
              );
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}