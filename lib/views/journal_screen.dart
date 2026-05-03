import 'package:flutter/material.dart';
import 'package:mad_project2/controllers/journal_service.dart';
import '../models/journal_model.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  JournalService _journalService = JournalService();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now().toString().split(' ')[0]; // YYYY-MM-DD format
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal Entry'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _currentDate,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                hintText: 'Write your thoughts here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            //save
            ElevatedButton(
              onPressed: () async {
                if (_contentController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please add text and select a mood")),
                  );
                  return;
                }

                try {
                  final entry = JournalModel(
                    id: '',
                    title: _titleController.text,
                    content: _contentController.text,
                    userId: _journalService.userId,
                    date: DateTime.now(),
                  );

                  print("USER ID: ${_journalService.userId}");

                  await _journalService.addJournal(entry);

                  print("SUCCESS");

                  Navigator.pop(context);
                } catch (e) {
                  print("ERROR: $e");
                }
              },
              child: Text('Save Entry'),
            ),
          ],
        ),
      ),
    );
  }
}