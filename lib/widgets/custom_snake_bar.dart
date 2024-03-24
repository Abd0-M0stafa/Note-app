import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void customSnakeBar(BuildContext context,
    {required String text, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
