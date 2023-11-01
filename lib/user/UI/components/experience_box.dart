import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/user/layout.dart';
import 'package:my_portfolio/utils/utils.dart';

class ExperienceBox extends StatefulWidget {
  final Screens currentScreen;
  const ExperienceBox({super.key, required this.currentScreen});

  @override
  State<ExperienceBox> createState() => _ExperienceBoxState();
}

class _ExperienceBoxState extends State<ExperienceBox> {
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
        child: Container(
          width: 528,
          margin: EdgeInsets.only(
              bottom: widget.currentScreen == Screens.phone
                  ? 10
                  : widget.currentScreen == Screens.tablet
                      ? 20
                      : 48),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: secondaryColor.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: widget.currentScreen == Screens.phone ||
                          widget.currentScreen == Screens.tablet
                      ? primaryColor
                      : isHovered
                          ? primaryColor
                          : const Color(0xFF27272A)),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(
                widget.currentScreen == Screens.phone ? 8 : 24.80),
            child: LayoutScreenExperience(
              currentScreen: widget.currentScreen,
              children: [
                Container(
                  width: widget.currentScreen == Screens.phone ||
                          widget.currentScreen == Screens.tablet
                      ? null
                      : 120,
                  padding: EdgeInsets.only(
                      top: 4,
                      bottom: widget.currentScreen == Screens.phone ? 0 : 8),
                  child: Text(
                    '2018 — PRESENT',
                    style: TextStyle(
                      color: const Color(0xFF64748B),
                      fontSize: widget.currentScreen == Screens.phone
                          ? 24
                          : widget.currentScreen == Screens.tablet
                              ? 25
                              : 12,

                      fontWeight: FontWeight.w600,
                      // height: 0.11,
                      letterSpacing: 0.30,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                LayoutHomeWidget(
                    currentScreen: widget.currentScreen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lead Engineer · Flutter Development',
                          style: TextStyle(
                            color: const Color(0xFFE2E8F0),
                            fontSize: widget.currentScreen == Screens.phone ||
                                    widget.currentScreen == Screens.tablet
                                ? 28
                                : 16,

                            fontWeight: widget.currentScreen == Screens.phone ||
                                    widget.currentScreen == Screens.tablet
                                ? FontWeight.w700
                                : FontWeight.w500,
                            //height: 0.08,
                          ),
                        ),
                        SizedBox(
                            height: widget.currentScreen == Screens.phone
                                ? 1.5
                                : 6.30),
                        Text(
                          'Deliver high-quality, robust production code for a diverse array of projects for clients including Harvard Business School, Everytown for Gun Safety, Pratt Institute, Koala Health, Vanderbilt University, The 19th News, and more.Provide leadership within engineering department through close collaboration, knowledge shares, and mentorship.',
                          style: TextStyle(
                            color: const Color(0xFF94A3B8),
                            fontSize: widget.currentScreen == Screens.phone ||
                                    widget.currentScreen == Screens.tablet
                                ? 26
                                : 14,

                            fontWeight: FontWeight.w400,
                            // height: 0.11,
                          ),
                        ),
                        SizedBox(
                            height: widget.currentScreen == Screens.phone ||
                                    widget.currentScreen == Screens.tablet
                                ? 5
                                : 17.30),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 8, right: 16, bottom: 3.60),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.link,
                                    size: widget.currentScreen == Screens.phone
                                        ? 5
                                        : 10,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'The Verge',
                                    style: TextStyle(
                                      color: const Color(0xFFCBD5E1),
                                      fontSize: widget.currentScreen ==
                                                  Screens.phone ||
                                              widget.currentScreen ==
                                                  Screens.tablet
                                          ? 24
                                          : 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
