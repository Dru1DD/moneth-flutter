import 'package:flutter/material.dart';

import './widgets.dart';

class BuildButton extends StatelessWidget {
  final String buttonText;
  final Function() pressedCallback;
  final double? buttonWidth;

  const BuildButton({
    super.key,
    required this.buttonText,
    required this.pressedCallback,
    this.buttonWidth = 55,
  });

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      start: 0.9,
      end: 0.8,
      color: Colors.redAccent,
      child: SizedBox(
        width: buttonWidth,
        child: MaterialButton(
          onPressed: pressedCallback,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
