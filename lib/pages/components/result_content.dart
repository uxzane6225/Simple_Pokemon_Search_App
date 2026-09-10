import 'package:flutter/material.dart';

class ResultContent extends StatelessWidget {
  final String title;
  final String? content; 

  const ResultContent({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          content ?? "No Pokemon yet",
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}