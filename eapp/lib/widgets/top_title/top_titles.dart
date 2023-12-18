import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitile;
  const TopTitles({super.key, required this.title, required this.subtitile});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kToolbarHeight,
        ),
        //-------------------------Title----------------------
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        //-------------------------Sub Title----------------------
        Text(
          subtitile,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
