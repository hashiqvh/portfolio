import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHoverText extends StatefulWidget {
  final Screens currentScreen;
  final String text;
  final String? url;

  const MyHoverText({
    super.key,
    required this.currentScreen,
    required this.text,
    this.url,
  });

  @override
  _MyHoverTextState createState() => _MyHoverTextState();
}

class _MyHoverTextState extends State<MyHoverText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        if (widget.url != null) {
          launchUrl(Uri.parse(widget.url!));
        }
      },
      child: MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: Text(
          widget.text,
          style: TextStyle(
            color: isHovered ? Colors.red : const Color(0xFFE2E8F0),
            fontSize: getFontSizeForScreen(
              tabSize: 16,
              phoneSize: 19,
              webSize: 16,
              currentScreen: widget.currentScreen,
            ),
            fontWeight: widget.currentScreen == Screens.phone ||
                    widget.currentScreen == Screens.tablet
                ? FontWeight.w400
                : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void onHover(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }
}
