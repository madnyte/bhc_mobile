import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String path;

  const Tile({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Image.asset(
        path,
        height: 40,
        width: 40,
      ),
    );
  }
}
