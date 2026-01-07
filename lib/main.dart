import 'package:flutter/material.dart';

void main() {
  runApp(const LuminaApp());
}

class LuminaApp extends StatelessWidget {
  const LuminaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lumina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: const Text('Welcome to Lumina'),
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('A calm, voice-first AI mental wellness companion.'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                // Placeholder for button action
              },
              child: const Text('Ask Lumina'),
            ),
          ],
        ),
      ),
    );
  }
}
