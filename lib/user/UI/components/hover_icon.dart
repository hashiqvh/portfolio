import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/utils.dart';

class HoverIcon extends StatefulWidget {
  final Screens screens;
  final IconData iconData;

  const HoverIcon({
    super.key,
    required this.iconData,
    required this.screens,
  });

  @override
  HoverIconState createState() => HoverIconState();
}

class HoverIconState extends State<HoverIcon> {
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
      child: Icon(
        widget.iconData,
        size: widget.screens == Screens.phone
            ? 25
            : widget.screens == Screens.tablet
                ? 30
                : 25,
        color: isHovered
            ? Colors.white
            : const Color(0xFF94A3B8), // Change this to your secondaryColor
      ),
    );
  }
}
