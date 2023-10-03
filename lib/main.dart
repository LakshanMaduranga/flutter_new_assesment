import 'package:flutter/material.dart';
import 'Screens/WelComeScreen.dart';

void main() {
  runApp(const DogApp());
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog List',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WelComeScreen(),
    );
  }
}
