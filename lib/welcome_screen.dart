import 'package:flutter/material.dart';
import 'package:hw4/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _initSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showTutorial', false);
  }

  @override
  Widget build(BuildContext context) {
    _initSharedPreferences();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Stack(
        children: [
          const Center(
            child: Text("Welcome! This is the tutorial screen."),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Skip'),
            ),
          ),
        ],
      ),
    );
  }
}
