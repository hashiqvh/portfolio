import 'package:flutter/material.dart';

class ViewResumeTile extends StatefulWidget {
  const ViewResumeTile({
    super.key,
  });

  @override
  ViewResumeTileState createState() => ViewResumeTileState();
}

class ViewResumeTileState extends State<ViewResumeTile> {
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
          Text(
            "View Resume",
            style: TextStyle(
              fontSize: 16,
              color: isHovered ? Colors.white : const Color(0xFF94A3B8),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isHovered ? 60 : 40, // Adjust width based on hover state

            child: const Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
