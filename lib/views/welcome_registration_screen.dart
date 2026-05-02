import 'package:flutter/material.dart';
import 'package:mad_project2/controllers/auth_service.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeRegistrationScreen extends StatefulWidget {
  const WelcomeRegistrationScreen({super.key});

  @override
  State<WelcomeRegistrationScreen> createState() => _WelcomeRegistrationScreenState();
}

class _WelcomeRegistrationScreenState extends State<WelcomeRegistrationScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                ScrambleAnimatedText(
                  'Welcome to Mental Zen Journaling App',
                  speed: const Duration(milliseconds: 200),
                ),
                ScrambleAnimatedText('Please Register to Continue'),
              ],
              onTap: () {
                  print("Tap Event");
              },
            ),

            const SizedBox(height: 20),
            // Registration Form
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}

