import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('audio/note$soundNumber.wav'));
  }

  Expanded buildKey({
    required Color color,
    required int soundNumber,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 3,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: const SizedBox.expand(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(
                color: Colors.red,
                soundNumber: 1,
              ),
              buildKey(
                color: Colors.orange,
                soundNumber: 2,
              ),
              buildKey(
                color: Colors.yellow,
                soundNumber: 3,
              ),
              buildKey(
                color: Colors.green,
                soundNumber: 4,
              ),
              buildKey(
                color: Colors.teal,
                soundNumber: 5,
              ),
              buildKey(
                color: Colors.blue,
                soundNumber: 6,
              ),
              buildKey(
                color: Colors.purple,
                soundNumber: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}