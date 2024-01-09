import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(
              "https://lqykieuptuztmjpvrpgc.supabase.co/storage/v1/object/sign/resume/Hashiq_VH.pdf?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJyZXN1bWUvSGFzaGlxX1ZILnBkZiIsImlhdCI6MTcwNDc3NDE0NSwiZXhwIjoyMDIwMTM0MTQ1fQ.i2Zt6y7qVjMHKgUYY3rOFQlT-duIxrU4yylV6RvAh98"));
        },
        child: Row(
          children: [
            Text(
              "View Resume",
              style: TextStyle(
                fontSize: 18,
                color: isHovered ? Colors.white : const Color(0xFF94A3B8),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isHovered ? 60 : 40, // Adjust width based on hover state

              child: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
