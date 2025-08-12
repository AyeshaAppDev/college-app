class Notice {
  final String id;
  final String title;
  final DateTime date;
  final String description;
  final String category;
  final bool isImportant;

  Notice({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.category,
    this.isImportant = false,
  });
}