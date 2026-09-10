import 'package:flutter/material.dart';

class SpriteContent extends StatelessWidget {
  final int? id;
  const new({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.network(
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png",
            scale: 0.1,
            errorBuilder: (context, error, stackTrace) {
              return Text("No image yet");
            },
          ),
        ),
      ),
    );
  }
}