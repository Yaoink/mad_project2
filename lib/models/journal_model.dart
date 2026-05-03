import 'package:cloud_firestore/cloud_firestore.dart';

class JournalModel {
  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime date;
  String? moodId;

  JournalModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.date,
    this.moodId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'content': content,
      'date': Timestamp.fromDate(date),
      'moodId': moodId,
    };
  }

  factory JournalModel.fromMap(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return JournalModel(
      id: doc.id,
      userId: data['userId'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      moodId: data['moodId'],
    );
  }
}