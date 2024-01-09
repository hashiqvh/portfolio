import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/core/models/project_model.dart';
import 'package:my_portfolio/user/UI/components/dynmaic_content_widget.dart';
import 'package:my_portfolio/user/UI/components/hover_icon.dart';
import 'package:my_portfolio/user/layout.dart';
import 'package:my_portfolio/utils/utils.dart';

class ProjectBox extends StatefulWidget {
  final ProjectModel projectModel;
  final Screens currentScreen;
  const ProjectBox(
      {super.key, required this.currentScreen, required this.projectModel});

  @override
  State<ProjectBox> createState() => _ProjectBoxState();
}

class _ProjectBoxState extends State<ProjectBox> {
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
                widget.currentScreen == Screens.phone ? 8 : 24.80),
            child: LayoutScreenExperience(
              currentScreen: widget.currentScreen,
              children: [
                // Container(
                //   width: widget.currentScreen == Screens.phone ||
                //           widget.currentScreen == Screens.tablet
                //       ? double.infinity
                //       : 120,
                //   color: Colors.blueGrey,
                //   height: widget.currentScreen != Screens.laptop ? 200 : 120,
                // ),
                widget.currentScreen == Screens.phone ||
                        widget.currentScreen == Screens.tablet
                    ? const SizedBox(height: 5)
                    : const SizedBox(width: 16),
                LayoutHomeWidget(
                    currentScreen: widget.currentScreen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.projectModel.name,
                          style: TextStyle(
                            color: const Color(0xFFE2E8F0),
                            fontSize: getFontSizeForScreen(
                                tabSize: 16,
                                phoneSize: 19,
                                webSize: 16,
                                currentScreen: widget.currentScreen),
                            fontWeight: widget.currentScreen == Screens.phone ||
                                    widget.currentScreen == Screens.tablet
                                ? FontWeight.w400
                                : FontWeight.w500,

                            //height: 0.08,
                          ),
                        ),
                        SizedBox(
                            height: widget.currentScreen != Screens.laptop
                                ? 10
                                : 6.30),
                        DynamicContent(
                          currentScreen: widget.currentScreen,
                          paragraph: widget.projectModel.description,
                          wordsToHighlight: widget.projectModel.words,
                        ),
                        SizedBox(
                            height: widget.currentScreen != Screens.laptop
                                ? 20
                                : 15.30),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  right: 16, bottom: 3.60),
                              child: Row(
                                children: [
                                  if (widget.projectModel.githubUrl.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: HoverIcon(
                                          text: "GitHub",
                                          link: widget.projectModel.githubUrl,
                                          iconData: FontAwesomeIcons.github,
                                          screens: widget.currentScreen),
                                    ),
                                  if (widget.projectModel.appUrl.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: HoverIcon(
                                          text: "Play Store",
                                          link: widget.projectModel.appUrl,
                                          iconData: FontAwesomeIcons.play,
                                          screens: widget.currentScreen),
                                    ),
                                  if (widget.projectModel.iosUrl.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: HoverIcon(
                                          text: "App Store",
                                          link: widget.projectModel.iosUrl,
                                          iconData: FontAwesomeIcons.appStore,
                                          screens: widget.currentScreen),
                                    ),
                                  if (widget.projectModel.webAppUrl.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: HoverIcon(
                                          text: "Website",
                                          link: widget.projectModel.webAppUrl,
                                          iconData: FontAwesomeIcons.link,
                                          screens: widget.currentScreen),
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
