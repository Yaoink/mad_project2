import 'package:flutter/material.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _controller = TextEditingController();
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
        child: TextField(
          controller: _controller,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Write your journal entry here...',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}