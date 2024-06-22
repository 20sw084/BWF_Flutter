class TaskData {
  final String title;
  final String type;
  final String description;
  final String category;

  TaskData({
    required this.title,
    required this.type,
    required this.description,
    required this.category,
  });

  TaskData.fromMap(Map<dynamic, dynamic> res)
      : title = res['title'],
        type = res['type'],
        description = res['description'],
        category = res['category'];

  Map<String, Object?> toMap() {
    return {
      'title': title,
      'type': type,
      'description': description,
      'category': category,
    };
  }
}
