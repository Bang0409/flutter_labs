import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MiCardApp());
}

class MiCardApp extends StatelessWidget {
  const MiCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/avatar.jpg'),
                ),

                const SizedBox(height: 15),

                const Text(
                  'ĐẶNG CÔNG BẰNG',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(
                  width: 180,
                  height: 25,
                  child: Divider(
                    color: Colors.white70,
                    thickness: 1,
                  ),
                ),

                Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 30,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      CupertinoIcons.phone_fill,
                      color: Colors.deepOrange,
                    ),
                    title: const Text(
                      '0332 823 108',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 30,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      CupertinoIcons.mail_solid,
                      color: Colors.deepOrange,
                    ),
                    title: const Text(
                      'bangdc.23it@vku.udn.vn',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}