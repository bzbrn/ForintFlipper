import 'package:flutter/material.dart';
import 'dart:math';

const List<String> possibleImages = ['assets/heads.png', 'assets/tails.png'];
final randomizer = Random();

class ForintFlipper extends StatefulWidget {
  const ForintFlipper({super.key});

  @override
  State<StatefulWidget> createState() => _ForintFlipperState();
}

class _ForintFlipperState extends State<ForintFlipper> {
  String currentImage = possibleImages[1];

  void _flipper() {
    setState(() {
      currentImage = possibleImages[randomizer.nextInt(2)];
    });
  }

  @override
  Widget build(BuildContext context) {
    // final isDarkMode =
    //     MediaQuery.of(context).platformBrightness == Brightness.dark;

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                currentImage,
                width: 300,
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: _flipper,
                child: const Text('Flip Coin'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
