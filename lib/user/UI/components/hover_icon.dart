import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverIcon extends StatefulWidget {
  final Screens screens;
  final String? link;
  final Color? color;
  final IconData iconData;

  const HoverIcon({
    super.key,
    required this.iconData,
    required this.screens,
    this.color,
    this.link,
  });

  @override
  HoverIconState createState() => HoverIconState();
}

class HoverIconState extends State<HoverIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        if (widget.link != null) {
          launchUrl(Uri.parse(widget.link!));
        }
      },
      child: MouseRegion(
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
              ? widget.color ?? Colors.white
              : const Color(0xFF94A3B8), // Change this to your secondaryColor
        ),
      ),
    );
  }
}
