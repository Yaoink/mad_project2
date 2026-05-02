class JournalModel {
  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime date;
  final List<String> moodId;

  JournalModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.date,
    required this.moodId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
      'moodId': moodId,
    };
  }

  factory JournalModel.fromMap(Map<String, dynamic> data) {
    return JournalModel(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      date: DateTime.parse(data['date']),
      moodId: List<String>.from(data['moodIds'] ?? []),
    );
  }
}