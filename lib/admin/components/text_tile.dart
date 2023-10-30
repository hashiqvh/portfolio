import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  final String heading, text;
  const TextTile({
    super.key,
    required this.heading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          text,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
