class MoodModel {
  final String mood;
  final DateTime timestamp;

  MoodModel({
    required this.mood,
    required this.timestamp,
    });

  Map<String, dynamic> toMap() {
    return {
      'mood': mood,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory MoodModel.fromMap(Map<String, dynamic> data) {
    return MoodModel(
      mood: data['mood'],
      timestamp: DateTime.parse(data['timestamp']),
    );
  }
}