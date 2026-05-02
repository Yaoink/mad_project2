import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/journal_model.dart';

class JournalService {
  final CollectionReference _journalCollection =
      FirebaseFirestore.instance.collection('journals');

  Future<void> addJournalEntry(JournalModel entry) async {
    try {
      await _journalCollection.add(entry.toMap());
    } catch (e) {
      print('Error adding journal entry: $e');
    }
  }

  Stream<List<JournalModel>> getJournalEntries() {
    return _journalCollection.snapshots().map((snapshot) =>
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