import 'package:flutter/material.dart';
import 'package:mad_project2/controllers/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import '../views/journal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
              Navigator.pushReplacementNamed(context, '/welcome');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome, ${_authService.currentUser?.email}!'),
      ),
    );
  }

}