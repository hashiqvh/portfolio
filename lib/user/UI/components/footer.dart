// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  final Screens currentScreen;
  const Footer({
    Key? key,
    required this.currentScreen,
  }) : super(key: key);

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Footer> {
  bool isFigmaHovered = false;
  bool isVSCodeHovered = false;
  bool isFlutterHovered = false;
  bool isSupabaseHovered = false;
  bool isVercelHovered = false;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          const TextSpan(
            text: 'Designed in ',
          ),
          buildHoverText(
            'Figma',
            "https://www.figma.com/",
          ),
          const TextSpan(
            text: ' and coded in ',
          ),
          buildHoverText(
            'Visual Studio Code',
            "https://code.visualstudio.com/",
          ),
          const TextSpan(
            text: ' by yours truly. Built with ',
          ),
          buildHoverText('Flutter', "https://flutter.dev/"),
          const TextSpan(
            text: ' and ',
          ),
          buildHoverText('Supabase', "https://supabase.com/"),
          const TextSpan(
            text: ', deployed with ',
          ),
          buildHoverText('Vercel', "https://vercel.com/"),
          const TextSpan(
            text: '. All text is set in the Inter typeface.',
          ),
        ],
      ),
    );
  }

  InlineSpan buildHoverText(String text, String link) {
    return WidgetSpan(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          updateHoverState(text, true);
        },
        onExit: (_) {
          updateHoverState(text, false);
        },
        child: InkWell(
          hoverColor: Colors.transparent,
          onTap: () {
            launchUrl(Uri.parse(link));
          },
          child: Text(
            text,
            style: TextStyle(
              color: getHoverColor(text),
            ),
          ),
        ),
      ),
    );
  }

  Color getHoverColor(String text) {
    switch (text) {
      case 'Figma':
        return isFigmaHovered ? primaryColor : const Color(0xFF94A3B8);
      case 'Visual Studio Code':
        return isVSCodeHovered ? primaryColor : const Color(0xFF94A3B8);
      case 'Flutter':
        return isFlutterHovered ? primaryColor : const Color(0xFF94A3B8);
      case 'Supabase':
        return isSupabaseHovered ? primaryColor : const Color(0xFF94A3B8);
      case 'Vercel':
        return isVercelHovered ? primaryColor : const Color(0xFF94A3B8);
      default:
        return Colors.black;
    }
  }

  @override
  void initState() {
    if (widget.currentScreen == Screens.phone ||
        widget.currentScreen == Screens.tablet) {
      setState(() {
        isFigmaHovered = true;
        isVSCodeHovered = true;
        isFlutterHovered = true;
        isSupabaseHovered = true;
        isVercelHovered = true;
      });
    }
    super.initState();
  }

  bool isHovered(String text) {
    switch (text) {
      case 'Figma':
        return isFigmaHovered;
      case 'Visual Studio Code':
        return isVSCodeHovered;
      case 'Flutter':
        return isFlutterHovered;
      case 'Supabase':
        return isSupabaseHovered;
      case 'Vercel':
        return isVercelHovered;
      default:
        return false;
    }
  }

  void updateHoverState(String text, bool isHovered) {
    setState(() {
      switch (text) {
        case 'Figma':
          isFigmaHovered = isHovered;
          break;
        case 'Visual Studio Code':
          isVSCodeHovered = isHovered;
          break;
        case 'Flutter':
          isFlutterHovered = isHovered;
          break;
        case 'Supabase':
          isSupabaseHovered = isHovered;
          break;
        case 'Vercel':
          isVercelHovered = isHovered;
          break;
      }
    });
  }
}
