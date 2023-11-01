import 'package:flutter/material.dart';

class HoverContainerVertical extends StatefulWidget {
  final String ttile;

  const HoverContainerVertical({
    super.key,
    required this.ttile,
  });

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainerVertical> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isHovered ? 60 : 40, // Adjust width based on hover state
            height: 3,
            color: isHovered
                ? Colors.white
                : const Color(0xFF94A3B8), // Change this to your secondaryColor
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.ttile,
            style: TextStyle(
              fontSize: 12,
              color: isHovered ? Colors.white : const Color(0xFF94A3B8),
            ),
          )
        ],
      ),
    );
  }
}
