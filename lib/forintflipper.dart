import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const List<String> possibleImages = ['assets/heads.png', 'assets/tails.png'];
final randomizer = Random();

class ForintFlipper extends StatefulWidget {
  const ForintFlipper({super.key});

  @override
  State<StatefulWidget> createState() => _ForintFlipperState();
}

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

var kDarkColorScheme =
    ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.blue);

class _ForintFlipperState extends State<ForintFlipper> {
  String currentImage = possibleImages[1];

  void _flipper() {
    setState(() {
      currentImage = possibleImages[randomizer.nextInt(2)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: lightDynamic,
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: darkDynamic,
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
    });
  }
}
