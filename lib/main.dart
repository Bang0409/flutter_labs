import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Magic8BallApp());
}

class Magic8BallApp extends StatelessWidget {
  const Magic8BallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BallPage(),
    );
  }
}

class BallPage extends StatefulWidget {
  const BallPage({super.key});

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;

  void changeBall() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('Ask Me Anything'),
        backgroundColor: const Color(0xFFD0A7F7),
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: TextButton(
          onPressed: changeBall,
          child: Image.asset(
            'assets/images/ball$ballNumber.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}