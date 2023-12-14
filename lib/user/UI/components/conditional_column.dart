import 'package:flutter/material.dart';

class ConditionalColumn extends StatelessWidget {
  final bool isExpanded;
  final List<Widget> children;

  const ConditionalColumn(
      {super.key, required this.isExpanded, required this.children});

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
  }
}
