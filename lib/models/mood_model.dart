class MoodModel {
  final String id;
  final String userId;
  final List<String> mood;
  final DateTime timestamp;

  MoodModel({
    required this.id,
    required this.userId,
    required this.mood,
    required this.timestamp,
    });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'mood': mood,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory MoodModel.fromMap(Map<String, dynamic> data) {
    return MoodModel(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      mood: List<String>.from(data['mood'] ?? []),
      timestamp: DateTime.parse(data['timestamp']),
    );
  }
}