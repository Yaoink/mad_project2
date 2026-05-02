import '../models/mood_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_service.dart';

class MoodService {
  String get userId => AuthService().currentUser?.uid ?? '';

  final CollectionReference _moodCollection = FirebaseFirestore.instance.collection('moods');

  Future<void> addMood(MoodModel mood) async {
    try {
      final newMood = MoodModel(
        id: _moodCollection.doc().id,
        userId: userId,
        mood: mood.mood,
        timestamp: mood.timestamp,
      );

      await _moodCollection.add(newMood.toMap());
    } catch (e) {
      print('Error adding mood: $e');
    }
  }

  Future<void> updateMood(MoodModel mood) async {
    try {
      await _moodCollection.doc(mood.id).update(mood.toMap());
    } catch (e) {
      print('Error updating mood: $e');
    }
  }

  Future<void> deleteMood(String id) async {
    try {
      await _moodCollection.doc(id).delete();
    } catch (e) {
      print('Error deleting mood: $e');
    }
  }

  Stream<List<MoodModel>> getMoods() {
    return _moodCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) =>
          snapshot.docs
              .map((doc) => MoodModel.fromMap(doc.data() as Map<String, dynamic>))
              .toList());
  }
}