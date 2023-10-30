import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoverIcon extends StatefulWidget {
  final IconData iconData;

  const HoverIcon({
    super.key,
    required this.iconData,
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
        size: 25.h,
        color: isHovered
            ? Colors.white
            : const Color(0xFF94A3B8), // Change this to your secondaryColor
      ),
    );
  }
}
