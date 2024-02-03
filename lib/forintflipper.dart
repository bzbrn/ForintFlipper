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

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(currentImage == 'assets/heads.png' ? 'Heads!' : 'Tails!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

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
                if (deviceWidth < 600)
                  Image.asset(
                    currentImage,
                    width: deviceWidth * 3 / 4,
                  )
                else
                  Image.asset(
                    currentImage,
                    width: 400,
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
