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
  int currentActiveIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Screens currentScreen = getScreenSize(MediaQuery.of(context).size.width);

    double heightBtwnContent = currentScreen == Screens.laptop
        ? 142
        : currentScreen == Screens.tablet
            ? 50
            : 15;

    return Scaffold(
      body: Listener(
        onPointerHover: (event) {
          // if (currentScreen != Screens.phone) {

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
                    top: y - 40.0,
                    left: x - 40.0,
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
            Consumer<DataProvider>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return LayoutScreen(
                  currentScreen: currentScreen,
                  children: [
                    LayoutHomeWidget(
                      currentScreen: currentScreen,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: calculatePaddingWidth(currentScreen),
                          top: currentScreen == Screens.phone
                              ? 15
                              : currentScreen == Screens.tablet
                                  ? 70
                                  : calculatePaddingHeight(currentScreen),
                          bottom: currentScreen == Screens.phone
                              ? 10
                              : currentScreen == Screens.tablet
                                  ? 70
                                  : calculatePaddingHeight(currentScreen),
                          right: calculatePaddingWidth(currentScreen),
                        ),
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
                              style: const TextStyle(
                                color: Color(0xFFE2E8F0),
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1.20,
                              ),
                            ),
                            SizedBox(
                              height: currentScreen == Screens.phone
                                  ? 3
                                  : currentScreen == Screens.tablet
                                      ? 10
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
                                letterSpacing: -0.50,
                              ),
                            ),
                            SizedBox(
                              height: currentScreen == Screens.phone ||
                                      currentScreen == Screens.tablet
                                  ? 10
                                  : 15,
                            ),
                            SizedBox(
                              width: currentScreen == Screens.tablet
                                  ? MediaQuery.of(context).size.width - 250
                                  : null,
                              child: Text(
                                value.dataResponse
                                    .introductoryContent['title_three'],
                                style: TextStyle(
                                  color: const Color(0xFF94A3B8),
                                  fontSize: currentScreen == Screens.phone ||
                                          currentScreen == Screens.tablet
                                      ? 20
                                      : 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            if (currentScreen == Screens.laptop) ...[
                              const SizedBox(height: 66),
                              buildHoverContainer(0, "About"),
                              const SizedBox(height: 10),
                              buildHoverContainer(1, "Experience"),
                              const SizedBox(height: 10),
                              buildHoverContainer(2, "Projects"),
                            ],
                            SizedBox(
                              height: currentScreen == Screens.phone
                                  ? 20
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
                    LayoutHomeWidget(
                      currentScreen: currentScreen,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                          left: calculatePaddingWidth(currentScreen),
                          right: calculatePaddingWidth(currentScreen),
                        ),
                        controller: _scrollController,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return getContentWidget(
                            index,
                            value.dataResponse.aboutUsData['content'],
                            currentScreen,
                            heightBtwnContent,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHoverContainer(int index, String title) {
    return GestureDetector(
      onTap: () {
        _scrollToWidget(index);
      },
      child: HoverContainerVertical(
        active: currentActiveIndex == index,
        ttile: title,
      ),
    );
  }

  Widget getContentWidget(int index, dynamic data, Screens currentScreen,
      double heightBtwnContent) {
    switch (index) {
      case 0:
        return UserAboutScreen(currentScreen: currentScreen, about: data);
      case 1:
        return Padding(
          padding: EdgeInsets.only(bottom: heightBtwnContent),
          child: Experience(currentScreen: currentScreen),
        );
      case 2:
        return Padding(
          padding: EdgeInsets.only(bottom: heightBtwnContent),
          child: Projects(currentScreen: currentScreen),
        );
      default:
        return Container();
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    Provider.of<DataProvider>(context, listen: false).fetchData(context);
    super.initState();
  }

  void _onScroll() {
    int index =
        (_scrollController.offset / MediaQuery.of(context).size.height).round();

    if (index != currentActiveIndex) {
      setState(() {
        currentActiveIndex = index;
      });
    }
  }

  void _scrollToWidget(int index) {
    setState(() {
      currentActiveIndex = index;
    });

    _scrollController.animateTo(
      index * MediaQuery.of(context).size.height,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
