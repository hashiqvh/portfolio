import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/core/provider/data_provider.dart';
import 'package:my_portfolio/user/UI/about/user_about.dart';
import 'package:my_portfolio/user/UI/components/hover_container_vertical.dart';
import 'package:my_portfolio/user/UI/components/hover_icon.dart';
import 'package:my_portfolio/user/UI/experience/user_experience.dart';
import 'package:my_portfolio/user/UI/proejcts/projects.dart';
import 'package:my_portfolio/user/layout.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  double x = 0.0;
  double y = 0.0;
  @override
  Widget build(BuildContext context) {
    Screens currentScreen = getScreenSize(MediaQuery.of(context).size.width);

    double screenHeight = currentScreen == Screens.laptop
        ? 1519
        : currentScreen == Screens.tablet
            ? 1000
            : 720;
    double screenWidth = currentScreen == Screens.laptop
        ? 739
        : currentScreen == Screens.tablet
            ? 800
            : 320;
    double heightBtwnContent = currentScreen == Screens.laptop
        ? 142
        : currentScreen == Screens.tablet
            ? 50
            : 15;
    return Scaffold(
      body: Listener(
        onPointerHover: (event) {
          // if (currentScreen != Screens.phone) {
          log("on pointer hover");
          setState(() {
            x = event.position.dx;
            y = event.position.dy;
          });
          //  }
        },
        child: Stack(
          children: [
            currentScreen == Screens.phone
                ? const SizedBox()
                : Positioned(
                    top:
                        y - 40.0, // Adjust the circle's position for its center
                    left:
                        x - 40.0, // Adjust the circle's position for its center
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            offset: const Offset(0, 0),
                            blurRadius: 200.0,
                          ),
                        ],
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(
                left: calculatePaddingWidth(currentScreen),
              ),
              child: Consumer<DataProvider>(
                builder: (context, value, child) {
                  if (value.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return LayoutScreen(currentScreen: currentScreen, children: [
                    LayoutHomeWidget(
                      currentScreen: currentScreen,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: currentScreen == Screens.phone
                              ? 10
                              : currentScreen == Screens.tablet
                                  ? 70
                                  : calculatePaddingHeight(currentScreen),
                          bottom: currentScreen == Screens.phone
                              ? 10
                              : currentScreen == Screens.tablet
                                  ? 70
                                  : calculatePaddingHeight(currentScreen),
                          right: currentScreen == Screens.phone ||
                                  currentScreen == Screens.tablet
                              ? calculatePaddingWidth(currentScreen)
                              : 0,
                        ),
                        child: SizedBox(
                          //width: 528.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (currentScreen == Screens.phone)
                                const SizedBox(
                                  height: 15,
                                ),
                              Text(
                                value.dataResponse
                                    .introductoryContent['title_one'],
                                style: TextStyle(
                                  color: const Color(0xFFE2E8F0),
                                  fontSize: currentScreen == Screens.phone ||
                                          currentScreen == Screens.tablet
                                      ? 80
                                      : 48,

                                  fontWeight: FontWeight.w700,
                                  // height: 0.02,
                                  letterSpacing: -1.20,
                                ),
                              ),
                              SizedBox(
                                height: currentScreen == Screens.phone
                                    ? 3
                                    : currentScreen == Screens.tablet
                                        ? 20
                                        : 12,
                              ),
                              Text(
                                value.dataResponse
                                    .introductoryContent['title_two'],
                                style: TextStyle(
                                  color: const Color(0xFFE2E8F0),
                                  fontSize: currentScreen == Screens.phone ||
                                          currentScreen == Screens.tablet
                                      ? 30
                                      : 20,

                                  fontWeight: FontWeight.w500,
                                  // height: 0.07,
                                  letterSpacing: -0.50,
                                ),
                              ),
                              SizedBox(
                                height: currentScreen == Screens.phone ||
                                        currentScreen == Screens.tablet
                                    ? 3
                                    : 15,
                              ),
                              Text(
                                value.dataResponse
                                    .introductoryContent['title_three'],
                                style: TextStyle(
                                  color: const Color(0xFF94A3B8),
                                  fontSize: currentScreen == Screens.phone ||
                                          currentScreen == Screens.tablet
                                      ? 28
                                      : 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              if (currentScreen == Screens.laptop) ...[
                                const SizedBox(
                                  height: 66,
                                ),
                                const HoverContainerVertical(
                                  ttile: "About",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const HoverContainerVertical(
                                  ttile: "Experience",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const HoverContainerVertical(
                                  ttile: "Projects",
                                ),
                              ],
                              SizedBox(
                                height: currentScreen == Screens.phone
                                    ? 10
                                    : currentScreen == Screens.tablet
                                        ? 25
                                        : 44,
                              ),
                              Row(
                                children: [
                                  HoverIcon(
                                      screens: currentScreen,
                                      iconData: FontAwesomeIcons.github),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  HoverIcon(
                                      screens: currentScreen,
                                      iconData: FontAwesomeIcons.linkedin),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  HoverIcon(
                                      screens: currentScreen,
                                      iconData: FontAwesomeIcons.twitter),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    LayoutHomeWidget(
                      currentScreen: currentScreen,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: calculatePaddingWidth(currentScreen),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserAboutScreen(
                                  currentScreen: currentScreen,
                                  about: value
                                      .dataResponse.aboutUsData['content']),
                              Experience(currentScreen: currentScreen),
                              SizedBox(
                                height: heightBtwnContent,
                              ),
                              Projects(
                                currentScreen: currentScreen,
                              ),
                              SizedBox(
                                height: heightBtwnContent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false).fetchData(context);
    super.initState();
  }
}
