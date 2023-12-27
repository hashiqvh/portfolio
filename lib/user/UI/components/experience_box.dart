import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/core/models/experience_model.dart';
import 'package:my_portfolio/user/layout.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceBox extends StatefulWidget {
  final ExperienceModel experienceModel;
  final Screens currentScreen;
  const ExperienceBox({
    super.key,
    required this.currentScreen,
    required this.experienceModel,
  });

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
            bottom: getFontSizeForScreen(
                tabSize: 30,
                phoneSize: 30,
                webSize: 40,
                currentScreen: widget.currentScreen),
          ),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: isHovered
                ? secondaryColor.withOpacity(0.2)
                : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: !isHovered
                  ? BorderSide.none
                  : BorderSide(
                      width: 1, color: secondaryColor.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(
                widget.currentScreen == Screens.phone ? 10 : 24.80),
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
                    '${widget.experienceModel.startDate} — ${widget.experienceModel.endDate}',
                    style: TextStyle(
                      color: const Color(0xFF64748B),
                      fontSize: getFontSizeForScreen(
                          tabSize: 12,
                          phoneSize: 17,
                          webSize: 12,
                          currentScreen: widget.currentScreen),

                      fontWeight: widget.currentScreen == Screens.phone ||
                              widget.currentScreen == Screens.tablet
                          ? FontWeight.w400
                          : FontWeight.w500,
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
                        InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {
                            if (widget.experienceModel.companyUrl != "") {
                              launchUrl(
                                  Uri.parse(widget.experienceModel.companyUrl));
                            }
                          },
                          child: Text(
                            "${widget.experienceModel.role} . ${widget.experienceModel.companyName}",
                            style: TextStyle(
                              color: widget.currentScreen == Screens.phone ||
                                      widget.currentScreen == Screens.tablet
                                  ? primaryColor
                                  : isHovered
                                      ? primaryColor
                                      : const Color(0xFFE2E8F0),
                              fontSize: getFontSizeForScreen(
                                tabSize: 16,
                                phoneSize: 19,
                                webSize: 16,
                                currentScreen: widget.currentScreen,
                              ),
                              fontWeight:
                                  widget.currentScreen == Screens.phone ||
                                          widget.currentScreen == Screens.tablet
                                      ? FontWeight.w400
                                      : FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: widget.currentScreen == Screens.phone
                                ? 10
                                : 6.30),
                        Text(
                          widget.experienceModel.description,
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
                        ),
                        SizedBox(
                            height: widget.currentScreen == Screens.phone ||
                                    widget.currentScreen == Screens.tablet
                                ? 5
                                : 17.30),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.start,
                          children: List.generate(
                            widget.experienceModel.skills
                                .length, // Adjust the number of items as needed
                            (index) => Container(
                              padding: const EdgeInsets.only(
                                top: 13,
                                left: 12,
                                right: 12,
                                bottom: 13,
                              ),
                              decoration: ShapeDecoration(
                                color: primaryColor.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9999),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.experienceModel.skills[index],
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.start,
                          children: List.generate(
                            widget.experienceModel.projects!
                                .length, // Adjust the number of items as needed
                            (index) => Container(
                              padding: const EdgeInsets.only(
                                  top: 8, right: 16, bottom: 3.60),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.link,
                                    size: getFontSizeForScreen(
                                        tabSize: 12,
                                        phoneSize: 12,
                                        webSize: 12,
                                        currentScreen: widget.currentScreen),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget
                                        .experienceModel.projects![index].name,
                                    style: TextStyle(
                                      color: const Color(0xFFCBD5E1),
                                      fontSize: getFontSizeForScreen(
                                          tabSize: 14,
                                          phoneSize: 12,
                                          webSize: 14,
                                          currentScreen: widget.currentScreen),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Assuming you have a widget for each wrap item
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
