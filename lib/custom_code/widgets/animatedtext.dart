// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:animated_text_kit/animated_text_kit.dart';

class Animatedtext extends StatefulWidget {
  const Animatedtext({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _AnimatedtextState createState() => _AnimatedtextState();
}

class _AnimatedtextState extends State<Animatedtext> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700.0,
      child: DefaultTextStyle(
        style: const TextStyle(
            fontSize: 30.0, fontFamily: 'roboto', color: Colors.black),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('APP Mobile!'),
            TypewriterAnimatedText('Systems Web!'),
            TypewriterAnimatedText('Development no code Flutterflow!'),
          ],
          isRepeatingAnimation: true,
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}
