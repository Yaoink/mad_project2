import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_service.dart';
import '../models/journal_model.dart';

class JournalService {
  String get userId => AuthService().currentUser?.uid ?? '';

  final CollectionReference _journalCollection =
      FirebaseFirestore.instance.collection('journals');

  Future<void> addJournalEntry(JournalModel entry) async {
    try {
      final newEntry = JournalModel(
        id: _journalCollection.doc().id,
        userId: userId,
        title: entry.title,
        content: entry.content,
        date: entry.date,
        mood: entry.mood,
      );

      await _journalCollection.add(newEntry.toMap());
    } catch (e) {
      print('Error adding journal entry: $e');
    }
  }

  Stream<List<JournalModel>> getJournalEntries() {
    return _journalCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) =>
          snapshot.docs
              .map((doc) => JournalModel.fromMap(doc.data() as Map<String, dynamic>))
              .toList());
  }

  Future<void> updateJournalEntry(JournalModel entry) async {
    try {
      await _journalCollection.doc(entry.id).update(entry.toMap());
    } catch (e) {
      print('Error updating journal entry: $e');
    }
  }

  Future<void> deleteJournalEntry(String id) async {
    try {
      await _journalCollection.doc(id).delete();
    } catch (e) {
      print('Error deleting journal entry: $e');
    }
  }
  
}