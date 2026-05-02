class JournalModel {
  final String id;
  final String title;
  final String content;
  final DateTime date;

  JournalModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
    };
  }

  factory JournalModel.fromMap(Map<String, dynamic> data) {
    return JournalModel(
      id: data['id'],
      title: data['title'],
      content: data['content'],
      date: DateTime.parse(data['date']),
    );
  }
}