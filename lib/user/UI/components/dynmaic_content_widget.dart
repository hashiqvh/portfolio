// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/utils/utils.dart';

class DynamicContent extends StatefulWidget {
  final Screens currentScreen;
  final String paragraph;
  final List<String> wordsToHighlight;

  const DynamicContent({
    super.key,
    required this.currentScreen,
    required this.paragraph,
    required this.wordsToHighlight,
  });

  @override
  DynamicContentState createState() => DynamicContentState();
}

class DynamicContentState extends State<DynamicContent> {
  Map<String, bool> highlightStates = {};

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          buildDynamicText(widget.paragraph),
        ],
      ),
    );
  }

  InlineSpan buildDynamicText(String text) {
    List<InlineSpan> spans = [];

    RegExp exp = RegExp(r"(\S+|\s+)");

    exp.allMatches(text).forEach((match) {
      String segment = match.group(0)!;
      bool shouldHighlight = widget.wordsToHighlight.contains(segment.trim());

      if (shouldHighlight) {
        spans.add(buildHighlightedText(segment));
      } else {
        spans.add(TextSpan(
          text: segment,
          style: TextStyle(
            color: const Color(0xFF94A3B8),
            fontSize: getFontSizeForScreen(
                tabSize: 14,
                phoneSize: 18,
                webSize: 14,
                currentScreen: widget.currentScreen),

            fontWeight: FontWeight.w400,
            // height: 0.11,
          ),
        ));
      }
    });

    return TextSpan(children: spans);
  }

  InlineSpan buildHighlightedText(String text) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: primaryColor,
        fontSize: getFontSizeForScreen(
            tabSize: 14,
            phoneSize: 18,
            webSize: 14,
            currentScreen: widget.currentScreen),
        // Add any other styling for highlighted text here
      ),
    );
  }

  @override
  void initState() {
    for (var word in widget.wordsToHighlight) {
      highlightStates[word] = true;
    }

    super.initState();
  }
}
