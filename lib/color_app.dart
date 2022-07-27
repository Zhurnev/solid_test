import 'dart:math';
import 'package:flutter/material.dart';

///Each value defines the intensity of the color as an integer between 0 and 255
const maxVal = 255;

///The size of the font used by the text "Hey there"
const double fontS = 24;

///This is the root widget of the app
class ColorApp extends StatefulWidget {
  ///Key constant constructor
  const ColorApp({Key? key}) : super(key: key);
  @override
  State<ColorApp> createState() => _ColorAppState();
}

class _ColorAppState extends State<ColorApp> {
  Color randomColor = Colors.white;
  Color compColor = Colors.black;
  List<int> rgb = [0, 0, 0];

  void _changeColor() {
    setState(
      () {
        for (var i = 0; i < rgb.length; i++) {
          rgb[i] = Random().nextInt(maxVal + 1);
        }
        randomColor = Color.fromRGBO(
          rgb.first,
          rgb[1],
          rgb[2],
          1,
        );
        compColor = Color.fromRGBO(
          maxVal - rgb.first,
          maxVal - rgb[1],
          maxVal - rgb[2],
          1,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color App',
      home: GestureDetector(
        onTap: _changeColor,
        child: Scaffold(
          backgroundColor: randomColor,
          body: Center(
            child: Text(
              'Hey there',
              style: TextStyle(color: compColor, fontSize: fontS),
            ),
          ),
        ),
      ),
    );
  }
}
