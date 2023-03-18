import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final String hintText;
  final String? type;

  const Label({
    super.key,
    required this.title,
    required this.textEditingController,
    required this.hintText,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
          ),
          controller: textEditingController,
        ),
      ],
    );
  }
}
