class MoodModel {
  final String id;
  final List<String> mood;
  final DateTime timestamp;

  MoodModel({
    required this.id,
    required this.mood,
    required this.timestamp,
    });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mood': mood,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory MoodModel.fromMap(Map<String, dynamic> data) {
    return MoodModel(
      id: data['id'] ?? '',
      mood: List<String>.from(data['mood'] ?? []),
      timestamp: DateTime.parse(data['timestamp']),
    );
  }
}